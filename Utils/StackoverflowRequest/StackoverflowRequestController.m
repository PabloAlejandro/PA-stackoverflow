//
//  StackoverflowRequestController.m
//  Stackoverflow
//
//  Created by Pau on 16/02/2016.
//

#import "StackoverflowRequestController.h"

// NSURLRequest utils
#import "ServerRequestUtils.h"

// Factory requests
#import "NetworkFactoryRequests.h"

static NSString * const kEndpoint = @"https://api.stackexchange.com/2.2/questions";

@implementation StackoverflowRequestController  {
    NSOperationQueue *queue;
}

@synthesize timeout;

- (id)init {
    if ((self = [super init])) {
        
        timeout = 60;
        queue = [NSOperationQueue new];
        [queue setName:@"StackoverflowRequestControllerQueue"];
    }
    return self;
}

- (NSString *)getEndpoint
{
    return kEndpoint;
}

- (void)getEntriesForOrder:(NSString *)order sort:(NSString *)sort site:(NSString *)site completion:(HottestEntriesBlock)doneBlock {
    
    NSString *url = [NSString stringWithFormat:@"%@?", [self getEndpoint]];
    url = [ServerRequestUtils addOrder:order toRequest:url];
    url = [ServerRequestUtils addSort:sort toRequest:url];
    url = [ServerRequestUtils addSite:site toRequest:url];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSMutableURLRequest *request = [ServerRequestUtils newRequestWithUrl:url timeoutInterval:timeout shouldHandleCookies:NO];
        
        [[NetworkFactoryRequests sharedInstance] sendAsynchronousRequest:request
                                                                   queue:queue
                                                       completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                                                           
                                                           if (error != nil) {
                                                               doneBlock(nil, error);
                                                           }
                                                           else {
                                                               [ServerRequestUtils processDataWithArray:data forContentKey:@"items" done:doneBlock];
                                                           }
                                                       }];
    });
}

@end
