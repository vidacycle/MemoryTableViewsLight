//
//  ArrayDataSource.h
//  MemoryTableViewsLight
//
//  Created by Abby Schlageter on 22/03/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//
//  indebted to help from http://www.objc.io/issue-1/lighter-view-controllers.html
//

#import <Foundation/Foundation.h>


typedef void (^TableViewCellConfigureBlock)(id cell, id item, id indexPath);

@interface ArrayDataSource : NSObject <UITableViewDataSource>

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
