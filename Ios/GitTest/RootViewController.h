//
//  RootViewController.h
//  GitTest
//
//  Created by Deepthi on 21/01/14.
//  Copyright (c) 2014 Deepthi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTTPRequest.h"
#import "ParseData.h"

@interface RootViewController : UIViewController{
    
    __weak IBOutlet UIButton *findRepoButton;
    HTTPRequest *req;
    NSData *data;
    ParseData *parseJSONData;
}

- (IBAction)findRepoClicked:(id)sender;
- (IBAction)commitDetailsClicked:(id)sender;
- (IBAction)authorCommentClicked:(id)sender;

@end
