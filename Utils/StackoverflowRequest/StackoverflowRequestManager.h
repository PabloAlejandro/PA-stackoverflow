//
//  StackoverflowRequestManager.h
//  Stackoverflow
//
//  Created by Pau on 16/02/2016.
//

#import <Foundation/Foundation.h>
#import "EntryParams.h"

typedef void(^HottestEntryParamsBlock)(NSArray <EntryParams * > *entries, NSError *error);

@interface StackoverflowRequestManager : NSObject

/*
 @method getStackoverflowHottestEntries
 @abstract Sends an async request in order to retrieve Stackoverflow hottest entries.
 @param doneBlock The Completion block with the response and any possible error.
 */
+ (void)getStackoverflowHottestEntries:(HottestEntryParamsBlock)doneBlock;

@end
