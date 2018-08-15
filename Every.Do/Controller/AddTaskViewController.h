//
//  AddTaskViewController.h
//  Every.Do
//
//  Created by Jamie on 2018-08-14.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"


@protocol SaveTaskProtocol

-(void)saveTask: (Todo*)toDo;


@end

@interface AddTaskViewController : UIViewController

@property id<SaveTaskProtocol>delegate;


@end
