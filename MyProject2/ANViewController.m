//
//  ANViewController.m
//  MyProject2
//
//  Created by Admin on 07.11.13.
//  Copyright (c) 2013 ANesko. All rights reserved.
//

#import "ANViewController.h"

@interface ANViewController ()

@end

@implementation ANViewController

@synthesize myLabel;

int i;

-(IBAction)pressButton{
    
    i=i+1;
    
    myLabel.text=[NSString stringWithFormat:@"%d", i];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
