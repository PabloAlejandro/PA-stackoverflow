//
//  DashboardViewController.m
//  Stackoverflow
//
//  Created by Pau on 16/02/2016.
//

#import "DashboardViewController.h"
#import "StackoverflowRequestManager.h"
#import "DashboardTableController.h"
#import "DetailsViewController.h"

static NSString * const kDetailsSegue = @"DetailsSegue";

@interface DashboardViewController () <DashboardTableControllerDelegate>

@property (nonatomic, weak) IBOutlet DashboardTableController * tableController;

@end

@implementation DashboardViewController {
    EntryParams *selectedParams;
}

@synthesize tableController;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self getHottestEntries];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (void)getHottestEntries
{
    [StackoverflowRequestManager getStackoverflowHottestEntries:^(NSArray <EntryParams *> *entries, NSError *error) {
        
        if(error != nil) {
            // TODO: Catch the error (ie. Show error message in a popup, call the method again, etc.)
            NSLog(@"Error: %@", error);
        }
        else {
            tableController.entries = entries;
        }
    }];
}

#pragma mark - DashboardTableControllerDelegate

- (void)dashboardTableControllerDidSelectEntryParams:(EntryParams *)params
{
    selectedParams = params;
    
    if(selectedParams != nil) {
        [self performSegueWithIdentifier:kDetailsSegue sender:self];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:kDetailsSegue]) {
        DetailsViewController *vc = [segue destinationViewController];
        vc.params = selectedParams;
    }
}

@end
