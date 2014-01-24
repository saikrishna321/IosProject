//
//  HTTPRequest.h
//  GitTest
//
//  Created by Deepthi on 23/01/14.
//  Copyright (c) 2014 Deepthi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPRequest : UIViewController{
    
}
-(NSData *)requestToGetData:(NSString *)requestType;

@end
