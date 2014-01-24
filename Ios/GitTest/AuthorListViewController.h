//
//  AuthorListViewController.h
//  GitTest
//
//  Created by Deepthi on 23/01/14.
//  Copyright (c) 2014 Deepthi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthorListViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>{
    
    NSMutableArray *dataArray;
    NSArray *authorArray;

}


@property (strong) NSMutableArray *dataArray;
@property (strong) NSArray *authorArray;




@end
