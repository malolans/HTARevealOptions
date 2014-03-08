//
//  HTATableViewController.m
//  HTARevealOptions
//
//  Created by Malu on 3/1/14.
//  Copyright (c) 2014 Haptrix. All rights reserved.
//

#import "HTATableViewController.h"

#import "HTATaskCell.h"
#import "HTAData.h"

@interface HTATableViewController () {
    NSMutableArray *characterData;
    NSIndexPath *selectedIndex;
}

@end

@implementation HTATableViewController

- (void)awakeFromNib
{
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    characterData = [HTAData getData];
    selectedIndex = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    static NSString *CellIdentifier = @"Cell";
    [self.tableView registerClass:[HTATaskCell class] forCellReuseIdentifier:CellIdentifier];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [characterData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    HTATaskCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    HTAData *aCharacter = [characterData objectAtIndex:indexPath.row];
    cell.nameLabel.text = aCharacter.name;
    cell.detialsLabel.text = aCharacter.fullName;
    cell.cellData = aCharacter;
    
    if ([indexPath isEqual:selectedIndex]) {
        [cell setAsExpanded];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![indexPath isEqual:selectedIndex]) {
        selectedIndex = indexPath;
    } else {
        selectedIndex = nil;
    }

    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                     withRowAnimation:UITableViewRowAnimationFade];
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![indexPath isEqual:selectedIndex]) {
        selectedIndex = nil;
    }
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                     withRowAnimation:UITableViewRowAnimationFade];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath isEqual:selectedIndex]) {
        return self.tableView.rowHeight * 2;
    } else {
        return self.tableView.rowHeight;
    }
}

@end
