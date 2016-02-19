//
//  ServerRequestUtils.m
//  Stackoverflow
//
//  Created by Pau on 16/02/2016.
//

#import "ServerRequestUtils.h"
#import "NSDictionary+Utils.h"

@implementation ServerRequestUtils

#pragma mark - Validations

+ (BOOL)httpMethodIsValid:(NSString *)httpMethod
{
    NSArray * methods = @[
                          @"GET",
                          @"PUT",
                          @"POST",
                          @"DELETE",
                          @"PATCH",
                          // ...
                          ];
    
    if([methods containsObject:httpMethod]) {
        return YES;
    }
    
    return NO;
}

#pragma mark - URL Request string compositing methods

+ (NSString *)addString:(NSString *)value key:(NSString *)key toRequest:(NSString *)request {
    
    return [NSString stringWithFormat:@"%@&%@=%@", request, key, value];
}

+ (NSString *)addFloat:(float)value key:(NSString *)key toRequest:(NSString *)request {
    
    return [NSString stringWithFormat:@"%@&%@=%f", request, key, value];
}

+ (NSString *)addInt:(int)value key:(NSString *)key toRequest:(NSString *)request {
    
    return [NSString stringWithFormat:@"%@&%@=%d", request, key, value];
}

#pragma mark - URL Request generic string compositing methods

+ (NSString *)addOrder:(NSString *)value toRequest:(NSString *)request {
    
    return [ServerRequestUtils addString:value key:kParamOrder toRequest:request];
}

+ (NSString *)addSort:(NSString *)value toRequest:(NSString *)request {
    
    return [ServerRequestUtils addString:value key:kParamSort toRequest:request];
}

+ (NSString *)addSite:(NSString *)value toRequest:(NSString *)request {
    
    return [ServerRequestUtils addString:value key:kParamSite toRequest:request];
}

// NSURLRequest

+ (NSMutableURLRequest *)addReferer:(NSURL *)referer toURLRequest:(NSMutableURLRequest *)request
{
    if(referer) {
        [request addValue:[NSString stringWithFormat:@"%@", referer] forHTTPHeaderField: kRefererKey];
    }
    
    return request;
}

+ (NSMutableURLRequest *)addToken:(NSString *)token toURLRequest:(NSMutableURLRequest *)request
{
    if(token) {
        [request addValue:[NSString stringWithFormat:@"Token %@", token] forHTTPHeaderField: kTokenAuthorizationKey];
    }
    
    return request;
}

+ (NSMutableURLRequest *)addKey:(NSString *)key toURLRequest:(NSMutableURLRequest *)request
{
    if(key) {
        [request addValue:key forHTTPHeaderField: kRequestKey];
    }
    
    return request;
}

+ (NSMutableURLRequest *)addSecretKey:(NSString *)key toURLRequest:(NSMutableURLRequest *)request
{
    if(key) {
        [request addValue:key forHTTPHeaderField: kRequestSecretKey];
    }
    
    return request;
}

+ (NSMutableURLRequest *)newRequestWithUrl:(NSString *)url timeoutInterval:(NSTimeInterval)timeout shouldHandleCookies:(BOOL)shouldHandleCookies
{
    NSAssert(url != nil, @"This methods requires an url");
    
    NSString *encoded = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:encoded] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:timeout];
    
    [request setHTTPShouldHandleCookies:shouldHandleCookies];
    
    return request;
}

+ (NSMutableURLRequest *)newRequestWithUrl:(NSString *)url userToken:(NSString *)userToken key:(NSString *)key secretKey:(NSString *)secretKey timeoutInterval:(NSTimeInterval)timeout httpMethod:(NSString *)httpMethod requestData:(NSData *)requestData shouldHandleCookies:(BOOL)shouldHandleCookies
{
    NSAssert(url != nil, @"This methods requires an url");
    NSAssert(httpMethod != nil, @"This methods requires an http method options: [GET, PUT, POST, DELETE or PATCH]");
    NSAssert([self httpMethodIsValid:httpMethod], @"This methods requires a valid option: [GET, PUT, POST, DELETE or PATCH]");
    
    NSString *encoded = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:encoded] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:timeout];
    
    [request setHTTPShouldHandleCookies:shouldHandleCookies];
    [request setHTTPMethod:httpMethod];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    if(requestData) {
        [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody: requestData];
    }
    
    request = [ServerRequestUtils addKey:key toURLRequest:request];
    request = [ServerRequestUtils addSecretKey:secretKey toURLRequest:request];
    request = [ServerRequestUtils addToken:userToken toURLRequest:request];
    
    return request;
}

+ (void)processDataWithArray:(NSData *)data forContentKey:(NSString *)contentKey done:(void (^)(NSArray *array, NSError *error))doneBlock
{
    NSError *error = nil;
    
    if (data == nil) {
        error = [NSError errorWithDomain:@"No data" code:512 userInfo:nil];
        doneBlock(nil, error);
        return;
    }
    
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

    if (error != nil) {
        error = [NSError errorWithDomain:@"Bad json format" code:513 userInfo:nil];
        doneBlock(nil, error);
        return;
    }
    
    NSArray *content = [jsonDictionary arrayForKey:contentKey];
    if(!content) {
        error = [NSError errorWithDomain:@"No content" code:514 userInfo:nil];
        doneBlock(nil, error);
        return;
    }
    
    if(![content isKindOfClass:[NSArray class]]) {
        error = [NSError errorWithDomain:@"Wrong content format" code:515 userInfo:nil];
        doneBlock(nil, error);
        return;
    }
    
    doneBlock(content, nil);
}

@end
