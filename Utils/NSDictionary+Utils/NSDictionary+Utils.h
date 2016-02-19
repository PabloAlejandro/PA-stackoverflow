//
//  NSDictionary+Utils.h
//  Stackoverflow
//
//  Created by Pau on 16/02/2016.
//

#import <Foundation/Foundation.h>

@interface NSDictionary(Utils)

- (NSNumber *)numberForKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key;
- (NSArray *)arrayForKey:(NSString *)key;
- (NSSet *)setForKey:(NSString *)key;
- (NSDictionary *)dictionaryForKey:(NSString *)key;
- (BOOL)boolForKey:(NSString *)key;

- (NSNumber *)numberForKey:(NSString *)key orDefault:(NSNumber *)value;
- (NSString *)stringForKey:(NSString *)key orDefault:(NSString *)value;
- (NSArray *)arrayForKey:(NSString *)key orDefault:(NSArray *)value;
- (NSDictionary *)dictionaryForKey:(NSString *)key orDefault:(NSDictionary *)value;
- (BOOL)boolForKey:(NSString *)key orDefault:(BOOL)value;

@end
