//
//  ANViewController.m
//  MyProject2
//
//  Created by Admin on 07.11.13.
//  Copyright (c) 2013 ANesko. All rights reserved.
//

#import "ANViewController.h"
#import "ANTableViewController.h"

@interface ANViewController ()

@end

@implementation ANViewController

@synthesize myLabel;

int i;

-(IBAction)pressButton{
    i=i+1;
    myLabel.text=[NSString stringWithFormat:@"%d", i];
}

-(IBAction)showTable:(id)sender{
    ANTableViewController *myTable=[[ANTableViewController alloc]init];
    //[self presentViewController:myTable animated:YES completion:nil];
    [self.navigationController pushViewController:myTable animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title=@"Menu";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
