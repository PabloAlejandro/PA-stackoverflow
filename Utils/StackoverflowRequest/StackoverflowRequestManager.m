//
//  StackoverflowRequestManager.m
//  Stackoverflow
//
//  Created by Pau on 16/02/2016.
//

#import "StackoverflowRequestManager.h"
#import "StackoverflowRequestController.h"

static NSString * const kOrder = @"desc";
static NSString * const kSort = @"hot";
static NSString * const kSite = @"stackoverflow";

@implementation StackoverflowRequestManager

+ (void)getStackoverflowHottestEntries:(HottestEntryParamsBlock)doneBlock
{
    StackoverflowRequestController *request = [StackoverflowRequestController new];
    request.timeout = 30;

    [request getEntriesForOrder:kOrder sort:kSort site:kSite completion:^(NSArray * entries, NSError * error) {

        NSArray <EntryParams *> * params = [EntryParams paramsFromEntries:entries];

        dispatch_async(dispatch_get_main_queue(), ^{
            doneBlock(params, error);
        });
    }];
}

@end
