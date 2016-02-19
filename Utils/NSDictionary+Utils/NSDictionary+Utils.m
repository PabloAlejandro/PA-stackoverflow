//
//  NSDictionary+Utils.m
//  Stackoverflow
//
//  Created by Pau on 16/02/2016.
//

#import "NSDictionary+Utils.h"

@implementation NSDictionary(Utils)

- (NSNumber *)numberForKey:(NSString *)key
{
    return [[self objectForKey:key] isKindOfClass:[NSNull class]] ? nil : (NSNumber *)[self objectForKey:key];
}

- (NSString *)stringForKey:(NSString *)key
{
    return [[self objectForKey:key] isKindOfClass:[NSNull class]] ? nil : (NSString *)[self objectForKey:key];
}

- (NSArray *)arrayForKey:(NSString *)key
{
    return [[self objectForKey:key] isKindOfClass:[NSNull class]] ? nil : (NSArray *)[self objectForKey:key];
}

- (NSSet *)setForKey:(NSString *)key
{
    return [[self objectForKey:key] isKindOfClass:[NSNull class]] ? nil : (NSSet *)[self objectForKey:key];
}

- (NSDictionary *)dictionaryForKey:(NSString *)key
{
    return [[self objectForKey:key] isKindOfClass:[NSNull class]] ? nil : (NSDictionary *)[self objectForKey:key];
}

- (BOOL)boolForKey:(NSString *)key
{
    return [[self objectForKey:key] isKindOfClass:[NSNull class]] ? FALSE : [[self objectForKey:key] boolValue];
}

- (NSNumber *)numberForKey:(NSString *)key orDefault:(NSNumber *)value
{
    return [self numberForKey:key] ? [self numberForKey:key] : value;
}

- (NSString *)stringForKey:(NSString *)key orDefault:(NSString *)value
{
    return [self stringForKey:key] ? [self stringForKey:key] : value;
}

- (NSArray *)arrayForKey:(NSString *)key orDefault:(NSArray *)value
{
     return [self arrayForKey:key] ? [self arrayForKey:key] : value;
}

- (NSDictionary *)dictionaryForKey:(NSString *)key orDefault:(NSDictionary *)value
{
     return [self dictionaryForKey:key] ? [self dictionaryForKey:key] : value;
}

- (BOOL)boolForKey:(NSString *)key orDefault:(BOOL)value
{
    return [self boolForKey:key] ? [self boolForKey:key] : value;
}

@end
