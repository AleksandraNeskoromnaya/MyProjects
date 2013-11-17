//
//  ANTableViewController.m
//  MyProject2
//
//  Created by Admin on 17.11.13.
//  Copyright (c) 2013 ANesko. All rights reserved.
//

#import "ANTableViewController.h"

@interface ANTableViewController ()

@end

@implementation ANTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"Table";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
