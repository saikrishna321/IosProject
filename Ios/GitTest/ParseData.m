//
//  ParseData.m
//  GitTest
//
//  Created by Deepthi on 24/01/14.
//  Copyright (c) 2014 Deepthi. All rights reserved.
//

#import "ParseData.h"

@implementation ParseData

-(NSString *)parseFindRepo: (NSData*)data{
        
    NSMutableArray *jsonArray=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSDictionary *jsonData = [jsonArray valueForKey:@"items"];
    NSArray * selectedArray = [jsonData valueForKeyPath:@"@distinctUnionOfObjects.repository.id"];
    NSString *idOfRepo = [selectedArray objectAtIndex:0];

    return idOfRepo;
}


-(NSMutableArray *)parseCommitDetails: (NSData*)data{
    
    NSMutableArray * parsedData = [[NSMutableArray alloc] init];
    NSArray *jsonArray=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    parsedData = [jsonArray valueForKey:@"author"];
    
    return parsedData;
}


-(NSMutableArray *)parseAuthorCommits: (NSData*)data{
    
    NSMutableArray * parsedData = [[NSMutableArray alloc] init];
    
    NSArray *jsonArray=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSArray * selectedArray = [jsonArray valueForKeyPath:@"@distinctUnionOfObjects.author.login"];
    NSArray * sortedArray = [selectedArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];
    
    NSMutableArray * dataArray = [[NSMutableArray alloc] init];
    
    for (int j = 0; j<[selectedArray count]; j++) {
        
        NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF.author.login contains[cd] %@", sortedArray[j]];
        NSArray *searchResults = [jsonArray filteredArrayUsingPredicate:resultPredicate];
        NSArray * selectedArray1 = [searchResults valueForKeyPath:@"@distinctUnionOfObjects.commit.message"];
        
        NSArray * sortedArray1 = [selectedArray1 sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            return [obj1 compare:obj2];
        }];
        
        NSDictionary *firstItemsArrayDict = [NSDictionary dictionaryWithObject:sortedArray1 forKey:sortedArray[j]];
        [dataArray addObject:firstItemsArrayDict];
    }
    
    [parsedData addObject:dataArray];
    [parsedData addObject:sortedArray];
    return parsedData;
}



@end
