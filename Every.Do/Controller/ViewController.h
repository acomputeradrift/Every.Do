//
//  ViewController.h
//  Every.Do
//
//  Created by Jamie on 2018-08-14.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddTaskViewController.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, SaveTaskProtocol>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

