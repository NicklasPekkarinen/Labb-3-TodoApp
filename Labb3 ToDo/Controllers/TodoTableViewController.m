//
//  TodoTableViewController.m
//  Labb3 ToDo
//
//  Created by Nicklas Pekkarinen on 2020-01-23.
//  Copyright © 2020 Nicklas Pekkarinen. All rights reserved.
//

#import "TodoTableViewController.h"

@interface TodoTableViewController ()
@property (nonatomic) NSMutableArray *todos;
@end

@implementation TodoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) viewWillAppear:(BOOL)animated {
    [self loadData];
    [self.tableView reloadData];
}

- (void) loadData {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    
    if ([settings objectForKey:@"todoList"] != NULL) {
        self.todos = [[settings objectForKey:@"todoList"] mutableCopy];
    } else {
        self.todos = [NSMutableArray new];
    }
}

- (void) saveData:(NSMutableArray*) updatedList {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];

    [settings setObject:updatedList forKey:@"todoList"];
    [settings synchronize];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.todos count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if([[self.todos[indexPath.row] objectForKey:@"completed"] isEqual:@1]) {
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[self.todos[indexPath.row] objectForKey:@"name"]];
        [attributedString addAttribute:NSStrikethroughStyleAttributeName value:@2 range:NSMakeRange(0, attributedString.length)];
        
        cell.textLabel.attributedText = attributedString;
    } else {
        NSString *string = [self.todos[indexPath.row] objectForKey:@"name"];
        cell.textLabel.text = string;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSMutableDictionary *tempDictionary = [self.todos[indexPath.row] mutableCopy];
    [tempDictionary setObject:[NSNumber numberWithBool:YES] forKey:@"completed"];
    [self.todos replaceObjectAtIndex:indexPath.row withObject:tempDictionary];
    [self saveData:self.todos];
    [self loadData];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.todos removeObjectAtIndex:indexPath.row];
        [self saveData:self.todos];
        [self loadData];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
