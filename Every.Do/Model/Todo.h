//
//  Todo.h
//  Every.Do
//
//  Created by Jamie on 2018-08-14.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *toDoDescription;
@property (nonatomic, assign) NSInteger priority;
@property (nonatomic, assign) BOOL isCompleted;

- (instancetype)initWithTitle: (NSString*)title withDescription: (NSString*)toDoDescription withPriority: (NSInteger)priority andisCompleted: (BOOL)isCompleted;

@end
