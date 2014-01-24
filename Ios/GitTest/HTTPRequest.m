//
//  HTTPRequest.m
//  GitTest
//
//  Created by Deepthi on 23/01/14.
//  Copyright (c) 2014 Deepthi. All rights reserved.
//

#import "HTTPRequest.h"

@implementation HTTPRequest

-(NSData *)requestToGetData:(NSString *)requestType{
    
    NSURL *myURL = [NSURL URLWithString:@"https://api.github.com/repositories/167174/commits?since=2013-12-01T00:00:00&sort=author"];
    
    if([requestType isEqualToString:@"1"]){
        myURL = [NSURL URLWithString:@"https://api.github.com/search/code?q=addClass+in:file+language:js+repo:jquery/jquery"];
    }else {
        myURL = [NSURL URLWithString:@"https://api.github.com/repositories/167174/commits?since=2013-12-01T00:00:00&sort=author"];
    }
    
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:myURL];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:urlRequest
                                          returningResponse:&response
                                                      error:&error];
    
    if (error) {
        NSLog(@"Error while accessing the GitHub data");
    }
    return data;
}

@end
