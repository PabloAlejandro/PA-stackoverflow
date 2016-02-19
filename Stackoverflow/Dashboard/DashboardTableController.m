//
//  DashboardTableController.m
//  Stackoverflow
//
//  Created by Pau on 16/02/2016.
//

#import "DashboardTableController.h"

@implementation DashboardTableController

@synthesize entries = _entries;

#pragma mark - Setters

- (void)setEntries:(NSArray <EntryParams *> *)entries
{
    _entries = entries;
    [self.tableView reloadData];
}

#pragma mark - Private methods

- (UITableViewCell *)cellAtIndexPath:(NSIndexPath *)indexPath
{
    EntryParams * params = [_entries objectAtIndex:indexPath.row];
    
    static NSString *cellIdentifier = @"cellID";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = params.title;
    
    return cell;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _entries.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self cellAtIndexPath:indexPath];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EntryParams * params = [_entries objectAtIndex:indexPath.row];
    
    if(params != nil && self.delegate != nil) {
        [self.delegate dashboardTableControllerDidSelectEntryParams:params];
    }
    
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


@end
