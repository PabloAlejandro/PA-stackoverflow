//
//  EntryParams.m
//  Stackoverflow
//
//  Created by Pau on 16/02/2016.
//

#import "EntryParams.h"
#import "NSDictionary+Utils.h"

@implementation EntryParams

@synthesize tags;
@synthesize is_answered;
@synthesize view_count;
@synthesize accepted_answer_id;
@synthesize answer_count;
@synthesize score;
@synthesize last_activity_date;
@synthesize creation_date;
@synthesize last_edit_date;
@synthesize question_id;
@synthesize link;
@synthesize title;
@synthesize user_reputation;
@synthesize user_user_id;
@synthesize user_accept_rate;
@synthesize user_user_type;
@synthesize user_profile_image;
@synthesize user_display_name;
@synthesize user_link;

+ (EntryParams *)paramsFromDictionary:(NSDictionary *)dictionary
{
    EntryParams *params = [EntryParams new];
    
    params.tags = [dictionary arrayForKey:@"tags"];
    params.is_answered = [dictionary numberForKey:@"is_answered"];
    params.view_count = [dictionary numberForKey:@"view_count"];
    params.accepted_answer_id = [dictionary numberForKey:@"accepted_answer_id"];
    params.answer_count = [dictionary numberForKey:@"answer_count"];
    params.score = [dictionary numberForKey:@"score"];
    params.last_activity_date = [dictionary numberForKey:@"last_activity_date"];
    params.creation_date = [dictionary numberForKey:@"creation_date"];
    params.last_edit_date = [dictionary numberForKey:@"last_edit_date"];
    params.question_id = [dictionary numberForKey:@"question_id"];
    params.link = [dictionary stringForKey:@"link"];
    params.title = [dictionary stringForKey:@"title"];
    
    NSDictionary *user_dictionary = [dictionary dictionaryForKey:@"owner"];
    
    if(user_dictionary) {
    
        params.user_reputation = [user_dictionary numberForKey:@"reputation"];
        params.user_user_id = [user_dictionary numberForKey:@"user_id"];
        params.user_accept_rate = [user_dictionary numberForKey:@"accept_rate"];
        params.user_user_type = [user_dictionary stringForKey:@"user_type"];
        params.user_profile_image = [user_dictionary stringForKey:@"profile_image"];
        params.user_display_name = [user_dictionary stringForKey:@"display_name"];
        params.user_link = [user_dictionary stringForKey:@"link"];
    }
    
    return params;
}

+ (NSArray <EntryParams *> *)paramsFromEntries:(NSArray *)entries
{
    NSMutableArray * paramsArray = [NSMutableArray new];
    for(NSDictionary *dictionary in entries) {
        EntryParams * params = [self paramsFromDictionary:dictionary];
        if(params) {
            [paramsArray addObject:params];
        }
    }
    return paramsArray;
}

@end
