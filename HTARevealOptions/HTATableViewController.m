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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![indexPath isEqual:selectedIndex]) {
        selectedIndex = indexPath;
    } else {
        selectedIndex = nil;
    }
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![indexPath isEqual:selectedIndex]) {
        selectedIndex = nil;
    }
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath isEqual:selectedIndex]) {
        return self.tableView.rowHeight * 2;
    } else {
        return self.tableView.rowHeight;
    }
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */

@end
