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
#import "DetailedViewController.h"

@interface ViewController ()


@property (nonatomic, strong) NSArray *taskArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Todo *task1 = [[Todo alloc] initWithTitle:@"Save the world" withDescription:@"Workarounds exist. For example, the structure can be set up so that individual shareholders hold the growth shares in OpCo, while HoldCo holds shares that carry only a right to dividends. That way, the business in OpCo can be sold by the individual shareholder to reap the capital gains and the capital gains exemption, while before that one-time event, the ongoing income stream from the business is sent up, tax free, to HoldCo"  withPriority:1 andisCompleted:NO];
    Todo *task2 = [[Todo alloc] initWithTitle:@"Brush my teeth" withDescription:@"Get the back molars!"  withPriority:2 andisCompleted:NO];
    Todo *task3 = [[Todo alloc] initWithTitle:@"Shave my back" withDescription:@"Further my relation to gorilla with hair removal"  withPriority:3 andisCompleted:YES];
    self.taskArray = @[task1, task2, task3];
//    [self.taskArray arrayByAddingObject:task1];
//    [self.taskArray arrayByAddingObject:task2];
//    [self.taskArray arrayByAddingObject:task3];
   
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    //ToDoTableViewCell
    
    ToDoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ToDoTableViewCell"];
    NSInteger row = indexPath.row;
    //if complete is yes all text is grey
    

    //else
    // Set the label of the text
    Todo *toDo = self.taskArray[row];
    cell.titleLabel.text = toDo.title;
    cell.descriptionLabel.text = toDo.toDoDescription;
    cell.priorityLabel.text = [NSString stringWithFormat:@"%li", (long)toDo.priority];
    cell.titleLabel.textColor = [UIColor blackColor];
    cell.descriptionLabel.textColor = [UIColor blackColor];
    
    if (toDo.isCompleted == YES){
        cell.titleLabel.textColor = [UIColor lightGrayColor];
        cell.descriptionLabel.textColor = [UIColor lightGrayColor];
        cell.priorityLabel.textColor = [UIColor lightGrayColor];
    }else{
    
   
        switch (toDo.priority) {
            case 1:
                cell.titleLabel.textColor = [UIColor redColor];
                break;
            case 2:
                cell.titleLabel.textColor = [UIColor orangeColor];
                break;
            case 3:
                cell.titleLabel.textColor = [UIColor greenColor];
                break;
            default:
                cell.titleLabel.textColor = [UIColor blackColor];
                break;
        }
    }
    
    // Tell the tableView to use this cell
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.taskArray.count;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //get the index path, get toDo object for that path and pass to detailed view controller
    //ToDetailsPage
    if ([segue.identifier isEqualToString:@"ToDetailsPage"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Todo *toDo = self.taskArray[indexPath.row];
        DetailedViewController  *detailedViewController = segue.destinationViewController;
        detailedViewController.toDo = toDo;
        
       
    }else if ([segue.identifier isEqualToString:@"ToAddTaskPage"]){
        AddTaskViewController  *addTaskViewController = segue.destinationViewController;
        addTaskViewController.delegate = self;
    }
    
}
- (void)saveTask:(Todo *)toDo{
    self.taskArray =[self.taskArray arrayByAddingObject:toDo];
    [self.tableView reloadData];
}

- (IBAction)didSwipeRight:(UISwipeGestureRecognizer*)sender {
    //add tableView to gesture
    //set the color of the text to grey
    CGPoint point = [sender locationInView:self.tableView];
    NSIndexPath *index = [self.tableView indexPathForRowAtPoint:point];
// get the todo item from the array
    Todo *toDo = self.taskArray[index.row];
    toDo.isCompleted = YES;
    // change the todo item
    //[self.tableView reloadData];
    [self sortAndReload];
    //reload tableview
}
- (IBAction)didSwipeLEft:(UISwipeGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.tableView];
    NSIndexPath *index = [self.tableView indexPathForRowAtPoint:point];
    // get the todo item from the array
    Todo *toDo = self.taskArray[index.row];
    toDo.isCompleted = NO;
    // change the todo item
    //[self.tableView reloadData];
    [self sortAndReload];
}

-(void) sortAndReload {
    self.taskArray =  [self.taskArray sortedArrayUsingComparator:^NSComparisonResult(Todo*  _Nonnull obj1, Todo*  _Nonnull obj2) {
        return obj1.isCompleted && !obj2.isCompleted;
    }];
    [self.tableView reloadData];
}


@end
