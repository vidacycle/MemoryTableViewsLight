//
//  MemoryCellDesign.m
//  MemoryTableViewsLight
//
//  Created by Abby Schlageter on 26/03/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "MemoryCellDesign.h"

@implementation MemoryCellDesign

-(void)designForCell:(UITableViewCell*)cell
{
    //design
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.textLabel.textColor = [UIColor blueColor];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
}

@end
