//
//  NewTodoViewController.m
//  Labb3 ToDo
//
//  Created by Nicklas Pekkarinen on 2020-01-24.
//  Copyright © 2020 Nicklas Pekkarinen. All rights reserved.
//

#import "NewTodoViewController.h"

@interface NewTodoViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userTaskField;
@property (nonatomic) NSMutableArray *todos;
@property (nonatomic) NSUserDefaults *settings;
@property (nonatomic) Todo *todo;

@end

@implementation NewTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [self loadData];
}

- (IBAction)saveTask:(id)sender {
    [self saveData:self.userTaskField.text];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) saveData:(NSString*) name {
    Todo *todo = [[Todo alloc] initWithName:name];
    
    NSDictionary *todoDictionary = [todo convertToDictionary];
    
    [self.todos addObject:todoDictionary];
    [self.settings setObject:self.todos forKey:@"todoList"];
    [self.settings synchronize];
}

- (void) loadData {
    self.settings = [NSUserDefaults standardUserDefaults];
    
    if ([self.settings objectForKey:@"todoList"] != NULL) {
        self.todos = [[self.settings objectForKey:@"todoList"] mutableCopy];
    } else {
        self.todos = [NSMutableArray new];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
