//
//  StackoverflowRequestController.h
//  Stackoverflow
//
//  Created by Pau on 16/02/2016.
//

#import <Foundation/Foundation.h>

typedef void(^HottestEntriesBlock)(NSArray *entries, NSError *error);

@interface StackoverflowRequestController : NSObject

/**
 * Timeout for requests
 */
@property float timeout;

/*
 @method getEntriesForOrder
 @abstract Sends an async request in order to retrieve entries.
 @param order The order param for the request
 @param sort The sort param for the request
 @param site The site param for the request
 @param doneBlock The Completion block with the response and any possible error.
 */
- (void)getEntriesForOrder:(NSString *)order sort:(NSString *)sort site:(NSString *)site completion:(HottestEntriesBlock)doneBlock;

@end
