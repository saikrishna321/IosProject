//
//  RootViewController.m
//  GitTest
//
//  Created by Deepthi on 21/01/14.
//  Copyright (c) 2014 Deepthi. All rights reserved.
//

#import "RootViewController.h"
#import "AuthorListViewController.h"
#import "ParseData.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
         req = [[HTTPRequest alloc] init];
         parseJSONData = [[ParseData alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)findRepoClicked:(id)sender {
    
    data = [req requestToGetData:@"1"];
        
    NSString *message = @"";
    NSString *title = @"";
    
    if (data == nil) {
        title = @"Error";
        message = @"Data not available";
    }else{
        NSString *repoId = [parseJSONData parseFindRepo:data];
        title = @"Info";
        message = [NSString stringWithFormat:@"Repository id for jquery/jquery is %@",repoId];
    }
    
    UIAlertView *alt = [[UIAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
    [alt show];


}

- (IBAction)commitDetailsClicked:(id)sender {
    
    data = [req requestToGetData:@"2"];
    
    NSArray *authorDetailsArray = [parseJSONData parseCommitDetails:data];
    
    NSString *message = @"";
    NSString *title = @"";
    
    if (data == nil) {
        title = @"Error";
        message = @"Data not available";
    }else{
        title = @"Info";
        message = [NSString stringWithFormat:@"Total commits since Dec 01, 2013 is %d",[authorDetailsArray count]];

    }
    
    UIAlertView *alt = [[UIAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alt show];

    
}

- (IBAction)authorCommentClicked:(id)sender {
    
    data = [req requestToGetData:@"3"];
    
    if (data == nil) {
        UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Data not available" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        alt.tag = 1;
        [alt show];
        
    }else{
        ParseData *parseData = [[ParseData alloc] init];
        NSArray *authorDetailsArray = [parseData parseAuthorCommits:data];
        
        AuthorListViewController *authorList = [[AuthorListViewController alloc] initWithNibName:@"AuthorListViewController" bundle:nil];
        
        authorList.dataArray = authorDetailsArray[0];
        authorList.authorArray = authorDetailsArray[1];
        
        [self.navigationController pushViewController:authorList animated:YES];
    }
}


@end
