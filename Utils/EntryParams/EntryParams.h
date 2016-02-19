//
//  EntryParams.h
//  Stackoverflow
//
//  Created by Pau on 16/02/2016.
//

#import <Foundation/Foundation.h>

@interface EntryParams : NSObject

// Question related parameters
@property (nonatomic, strong) NSArray * tags;
@property (nonatomic, strong) NSNumber * is_answered;
@property (nonatomic, strong) NSNumber * view_count;
@property (nonatomic, strong) NSNumber * accepted_answer_id;
@property (nonatomic, strong) NSNumber * answer_count;
@property (nonatomic, strong) NSNumber * score;
@property (nonatomic, strong) NSNumber * last_activity_date;
@property (nonatomic, strong) NSNumber * creation_date;
@property (nonatomic, strong) NSNumber * last_edit_date;
@property (nonatomic, strong) NSNumber * question_id;
@property (nonatomic, strong) NSString * link;
@property (nonatomic, strong) NSString * title;

// User related parameters
@property (nonatomic, strong) NSNumber * user_reputation;
@property (nonatomic, strong) NSNumber * user_user_id;
@property (nonatomic, strong) NSNumber * user_accept_rate;
@property (nonatomic, strong) NSString * user_user_type;
@property (nonatomic, strong) NSString * user_profile_image;
@property (nonatomic, strong) NSString * user_display_name;
@property (nonatomic, strong) NSString * user_link;

/*
 @method paramsFromDictionary
 @abstract Creates an EntryParams object with the dictionary information
 @param dictionary The dictionary containing the params information
 */
+ (EntryParams *)paramsFromDictionary:(NSDictionary *)dictionary;

/*
 @method paramsFromEntries
 @abstract Creates an array of EntryParams objects with the information of dictionaries in the array
 @param entries The array of dictionaries containing the params information
 */
+ (NSArray <EntryParams *> *)paramsFromEntries:(NSArray *)entries;

@end
