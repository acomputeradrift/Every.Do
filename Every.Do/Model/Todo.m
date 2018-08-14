//
//  Todo.m
//  Every.Do
//
//  Created by Jamie on 2018-08-14.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import "Todo.h"

@implementation Todo

- (instancetype)initWithTitle: (NSString*)title withDescription: (NSString*)toDoDescription withPriority: (NSInteger)priority andisCompleted: (BOOL)isCompleted
{
    self = [super init];
    if (self) {
        _title = title;
        _toDoDescription = toDoDescription;
        _priority = priority;
        _isCompleted = isCompleted;
    }
    return self;
}

@end
