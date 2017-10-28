//
//  TableViewController.m
//  FPSView
//
//  Created by Victor Zhang on 28/10/2017.
//  Copyright © 2017 Victor Studio. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(back)];
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.imageView.image = [UIImage imageNamed:@"victor_author"];
    cell.textLabel.text = [NSString stringWithFormat:@"title %ld", indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"details %ld", indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    return cell;
}

@end
