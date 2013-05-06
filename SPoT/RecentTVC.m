//
//  RecentTVC.m
//  SPoT
//
//  Created by Angel on 5/3/13.
//  Copyright (c) 2013 edu.labs. All rights reserved.
//

#import "RecentTVC.h"
#import "UserDefaultManager.h"
#import "FlickrFetcher.h"

@interface RecentTVC ()

@end

@implementation RecentTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self setDetailPhotos:[[NSUserDefaults standardUserDefaults] arrayForKey:@"recentlyViewed"]];
    NSLog(@"View appeared");
    //NSLog(@"%@", self.detailPhotos);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    
    if ([segue.identifier isEqualToString:@"recentToImageView"]) {
        UIViewController *imageViewController = segue.destinationViewController;
        [imageViewController performSelector:@selector(setImageURL:) withObject:[FlickrFetcher urlForPhoto:[self dictionaryAtIndex:indexPath.row] format:FlickrPhotoFormatLarge]];
        [imageViewController setTitle:[[self dictionaryAtIndex:indexPath.row] objectForKey:@"title"]];
        
        [UserDefaultManager setRecentlyViewedImageWith:[self dictionaryAtIndex:indexPath.row]];
    }
}*/

@end
