//
//  NetworkFactoryRequests.m
//  Stackoverflow
//
//  Created by Pau on 16/02/2016.
//

#import "NetworkFactoryRequests.h"

@implementation NetworkFactoryRequests

+ (NetworkFactoryRequests *)sharedInstance {
    
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{instance = self.new;});
    return instance;
}

- (void)sendAsynchronousRequest:(NSURLRequest *)request
    queue:(NSOperationQueue *)queue
    completionHandler:(void (^)(NSURLResponse *response, NSData *data, NSError *error))completionHandler {
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:queue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               
                               completionHandler(response, data, nil);
                           }];
}

@end
