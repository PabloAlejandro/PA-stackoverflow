//
//  NetworkFactoryRequests.h
//  Stackoverflow
//
//  Created by Pau on 16/02/2016.
//

#import <Foundation/Foundation.h>

/**
 * This interface is used to abstract network operations in a way that asynchronous operations can be called
 * from a testing environment.
 */

@interface NetworkFactoryRequests : NSObject

+ (NetworkFactoryRequests *)sharedInstance;

- (void)sendAsynchronousRequest:(NSURLRequest *)request
    queue:(NSOperationQueue*) queue
    completionHandler:(void (^)(NSURLResponse*, NSData*, NSError*)) handler NS_AVAILABLE(10_7, 5_0);

@end