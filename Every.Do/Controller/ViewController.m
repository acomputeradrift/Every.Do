//
//  ViewController.m
//  Every.Do
//
//  Created by Jamie on 2018-08-14.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import "ViewController.h"
#import "Todo.h"
#import "ToDoTableViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *taskArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Todo *task1 = [[Todo alloc] initWithTitle:@"Save the world" withDescription:@"Come up with a plan for being a hero"  withPriority:1 andisCompleted:NO];
    Todo *task2 = [[Todo alloc] initWithTitle:@"Brush my teeth" withDescription:@"Get the back molars!"  withPriority:2 andisCompleted:NO];
    Todo *task3 = [[Todo alloc] initWithTitle:@"Shave my back" withDescription:@"Further my relation to gorilla with hair removal"  withPriority:3 andisCompleted:YES];
    self.taskArray = [[NSMutableArray alloc] init];
    [self.taskArray addObject:task1];
    [self.taskArray addObject:task2];
    [self.taskArray addObject:task3];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    //ToDoTableViewCell
    
    ToDoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ToDoTableViewCell"];
    NSInteger row = indexPath.row;
    
    // Set the label of the text
    Todo *toDo = self.taskArray[row];
    cell.titleLabel.text = toDo.title;
    cell.descriptionLabel.text = toDo.toDoDescription;
    cell.priorityLabel.text = [NSString stringWithFormat:@"%li", (long)toDo.priority];
    
    // Tell the tableView to use this cell
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.taskArray.count;
}



@end
