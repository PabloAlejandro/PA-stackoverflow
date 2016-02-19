//
//  DashboardTableController.h
//  Stackoverflow
//
//  Created by Pau on 16/02/2016.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "EntryParams.h"

@protocol DashboardTableControllerDelegate <NSObject>

- (void)dashboardTableControllerDidSelectEntryParams:(EntryParams *)params;

@end

@interface DashboardTableController : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic) IBOutlet id <DashboardTableControllerDelegate> delegate;
@property (nonatomic, strong) NSArray <EntryParams *> * entries;

@end
