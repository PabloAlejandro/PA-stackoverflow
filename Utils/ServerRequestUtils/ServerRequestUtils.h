//
//  ServerRequestUtils.h
//  Stackoverflow
//
//  Created by Pau on 16/02/2016.
//

#import <Foundation/Foundation.h>

#define kParamOrder @"order"
#define kParamSort @"sort"
#define kParamSite @"site"

#define kRefererKey @"Referer"
#define kTokenAuthorizationKey @"Authorization"
#define kRequestKey @"X-Client-ID"
#define kRequestSecretKey @"X-Client-Secret"
#define kRequestDeviceID @"X-Device-ID"
#define kUserAgent @"User-Agent"

/**
 * Interface to build standard server requests.
 */
@interface ServerRequestUtils : NSObject

/* Validations */

+ (BOOL)httpMethodIsValid:(NSString *)httpMethod;

/* Supported parameter types by key */

+ (NSString *)addString:(NSString *)value key:(NSString *)key toRequest:(NSString *)request;
+ (NSString *)addFloat:(float)value key:(NSString *)key toRequest:(NSString *)request;
+ (NSString *)addInt:(int)value key:(NSString *)key toRequest:(NSString *)request;

/* General parameters */

+ (NSString *)addOrder:(NSString *)value toRequest:(NSString *)request;
+ (NSString *)addSort:(NSString *)value toRequest:(NSString *)request;
+ (NSString *)addSite:(NSString *)value toRequest:(NSString *)request;

/* NSURLRequest parameters */

+ (NSMutableURLRequest *)addReferer:(NSURL *)referer toURLRequest:(NSMutableURLRequest *)request;
+ (NSMutableURLRequest *)addToken:(NSString *)token toURLRequest:(NSMutableURLRequest *)request;
+ (NSMutableURLRequest *)addKey:(NSString *)key toURLRequest:(NSMutableURLRequest *)request;
+ (NSMutableURLRequest *)addSecretKey:(NSString *)key toURLRequest:(NSMutableURLRequest *)request;

/* NSURLRequest */

+ (NSMutableURLRequest *)newRequestWithUrl:(NSString *)url timeoutInterval:(NSTimeInterval)timeout shouldHandleCookies:(BOOL)shouldHandleCookies;
// The API we are using in this demo doesn't require authentication, but it case we need it, we can use this method
+ (NSMutableURLRequest *)newRequestWithUrl:(NSString *)url userToken:(NSString *)userToken key:(NSString *)key secretKey:(NSString *)secretKey timeoutInterval:(NSTimeInterval)timeout httpMethod:(NSString *)httpMethod requestData:(NSData *)requestData shouldHandleCookies:(BOOL)shouldHandleCookies;

/* Response process */

+ (void)processDataWithArray:(NSData *)data forContentKey:(NSString *)contentKey done:(void (^)(NSArray *array, NSError *error))doneBlock;

@end
