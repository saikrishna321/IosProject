//
//  ParseData.h
//  GitTest
//
//  Created by Deepthi on 24/01/14.
//  Copyright (c) 2014 Deepthi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParseData : NSObject

-(NSString *)parseFindRepo: (NSData*)data;
-(NSMutableArray *)parseCommitDetails: (NSData*)data;
-(NSMutableArray *)parseAuthorCommits: (NSData*)data;

@end
