//
//  FeaturedTVC.m
//  SPoT
//
//  Created by Angel on 5/2/13.
//  Copyright (c) 2013 edu.labs. All rights reserved.
//

#import "FeaturedTVC.h"

@interface FeaturedTVC ()

@end

@implementation FeaturedTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)prepareArrayForSegueWith:(NSUInteger)row
{
    return [NSArray arrayWithArray:[self.tags objectForKey:[self currentKeyForRow:row]]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tags count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"tagCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *currentKey = [self currentKeyForRow:indexPath.row];
    NSUInteger photoCount = [self photoCountWithKey:currentKey];
    
    cell.textLabel.text = [currentKey capitalizedString];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d %@", photoCount, (photoCount == 1 ? @"Photo" : @"Photos")];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    
    if ([segue.identifier isEqualToString:@"featuredToDetail"]) {
        UIViewController *newController = segue.destinationViewController;
        [newController performSelector:@selector(setDetailPhotos:) withObject:[self prepareArrayForSegueWith:indexPath.row]];
        [newController setTitle:[[self currentKeyForRow:indexPath.row] capitalizedString]];
    }
}

@end
