//
//  StackoverflowTests.m
//  StackoverflowTests
//
//  Created by Pau on 16/02/2016.
//

#import <XCTest/XCTest.h>
#import "EntryParams.h"

@interface StackoverflowTests : XCTestCase

@end

@implementation StackoverflowTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEntryParams {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSDictionary * dictionary = @{
                     @"tags": @[
                              @"javascript",
                              @"jquery",
                              @"html5"
                              ],
                     @"owner": @{
                         @"reputation": @1299,
                         @"user_id": @545132,
                         @"user_type": @"registered",
                         @"accept_rate": @85,
                         @"profile_image": @"https://www.gravatar.com/avatar/718c692914f31fd2d80f26f14964dbe8?s=128&d=identicon&r=PG",
                         @"display_name": @"Syntax_Error",
                         @"link": @"http://stackoverflow.com/users/545132/syntax-error"
                     },
                     @"is_answered": [NSNumber numberWithBool:true],
                     @"view_count": @30,
                     @"accepted_answer_id": @35429509,
                     @"answer_count": @2,
                     @"score": @4,
                     @"last_activity_date": @1455618377,
                     @"creation_date": @1455616842,
                     @"last_edit_date": @1455617368,
                     @"question_id": @35429305,
                     @"link": @"http://stackoverflow.com/questions/35429305/set-value-of-input-type-date-bug",
                     @"title": @"Set value of input type date bug"
                     };
    
    EntryParams * params = [EntryParams paramsFromDictionary:dictionary];
    
    NSAssert(params != nil, @"params should be nil");
}

- (void)testEntryParamsArray {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSArray * array = @[@{
                            @"tags": @[
                                    @"javascript",
                                    @"jquery",
                                    @"html5"
                                    ],
                            @"owner": @{
                                    @"reputation": @1299,
                                    @"user_id": @545132,
                                    @"user_type": @"registered",
                                    @"accept_rate": @85,
                                    @"profile_image": @"https://www.gravatar.com/avatar/718c692914f31fd2d80f26f14964dbe8?s=128&d=identicon&r=PG",
                                    @"display_name": @"Syntax_Error",
                                    @"link": @"http://stackoverflow.com/users/545132/syntax-error"
                                    },
                            @"is_answered": [NSNumber numberWithBool:true],
                            @"view_count": @30,
                            @"accepted_answer_id": @35429509,
                            @"answer_count": @2,
                            @"score": @4,
                            @"last_activity_date": @1455618377,
                            @"creation_date": @1455616842,
                            @"last_edit_date": @1455617368,
                            @"question_id": @35429305,
                            @"link": @"http://stackoverflow.com/questions/35429305/set-value-of-input-type-date-bug",
                            @"title": @"1. Set value of input type date bug"
                            },
                        @{
                            @"tags": @[
                                    @"javascript",
                                    @"jquery",
                                    @"html5"
                                    ],
                            @"owner": @{
                                    @"reputation": @1299,
                                    @"user_id": @545132,
                                    @"user_type": @"registered",
                                    @"accept_rate": @85,
                                    @"profile_image": @"https://www.gravatar.com/avatar/718c692914f31fd2d80f26f14964dbe8?s=128&d=identicon&r=PG",
                                    @"display_name": @"Syntax_Error",
                                    @"link": @"http://stackoverflow.com/users/545132/syntax-error"
                                    },
                            @"is_answered": [NSNumber numberWithBool:true],
                            @"view_count": @30,
                            @"accepted_answer_id": @35429509,
                            @"answer_count": @2,
                            @"score": @4,
                            @"last_activity_date": @1455618377,
                            @"creation_date": @1455616842,
                            @"last_edit_date": @1455617368,
                            @"question_id": @35429306,
                            @"link": @"http://stackoverflow.com/questions/35429305/set-value-of-input-type-date-bug",
                            @"title": @"2. Set value of input type date bug"
                            }
                        ];
    
    NSArray * resultArray = [EntryParams paramsFromEntries:array];
    
    NSAssert(resultArray != nil, @"resultArray should be nil");
    NSAssert(resultArray.count == 2, @"resultArray should contain 2 objects");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
