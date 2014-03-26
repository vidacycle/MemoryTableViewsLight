//
//  MemoryTableViewController.m
//  MemoryTableViewsLight
//
//  Created by Abby Schlageter on 22/03/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//
//  indebted to help from http://www.objc.io/issue-1/lighter-view-controllers.html

#import "MemoryTableViewController.h"
#import "ArrayDataSource.h"
#import "MemoryData.h"
#import "MemoryCellDesign.h"

@interface MemoryTableViewController ()
@property (nonatomic, strong) ArrayDataSource *theArrayDataSource; //tableV data Source
@property (nonatomic, strong) NSArray *theArray;
@property (nonatomic, strong) MemoryData *theData;
@property (nonatomic, strong) NSString *checkedCell;
@property (nonatomic, strong) NSIndexPath *checkedIndexPath;
@end

static NSString *CellIdentifier = @"Cell";

@implementation MemoryTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //set initial data from database
    self.theData = [[MemoryData alloc] init];
    self.theArray = self.theData.theArray;
    self.checkedCell = self.theData.memoryState;
    [self setupTableView];
}


- (void)setupTableView
{
    TableViewCellConfigureBlock configureCell = ^(UITableViewCell *cell, NSString *item, NSIndexPath *indexPath)
    {
        //design
        MemoryCellDesign *design = [[MemoryCellDesign alloc] init];
        [design designForCell:cell];
        
        //set initial checked cell based on memoryData
        if (item == self.checkedCell)
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            self.checkedIndexPath = indexPath;
        }
        else
        {
           cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
        //ensures that only one cell can ever be selected
        if([self.checkedIndexPath isEqual:indexPath])
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    
    };
    
    self.theArrayDataSource = [[ArrayDataSource alloc] initWithItems:self.theArray
                                                       cellIdentifier:CellIdentifier
                                                   configureCellBlock:configureCell];
    
    self.tableView.dataSource = self.theArrayDataSource;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:NO];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    //first uncheck the already selected cell
    if(self.checkedIndexPath)
    {
        UITableViewCell *uncheckCell = [tableView
                                        cellForRowAtIndexPath:self.checkedIndexPath];
        uncheckCell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    //now check the currently selected cell
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    self.checkedIndexPath = indexPath;
}



@end
