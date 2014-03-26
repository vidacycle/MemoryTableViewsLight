//
//  MemoryData.m
//  MemoryTableViewsLight
//
//  Created by Abby Schlageter on 22/03/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "MemoryData.h"

@interface MemoryData ()

@end

@implementation MemoryData


-(id) init
{
    if (self = [super init])
    {
        //currently just setting the memory state and index, but will load this in from server database
        _theArray = [NSArray arrayWithObjects:@"one", @"two", @"three", @"four", nil];
        _memoryState = @"two";
        _memoryIndex = 1;
        
    }
    return self;
}

@end
