//
//  ANViewController.h
//  MyProject2
//
//  Created by Admin on 07.11.13.
//  Copyright (c) 2013 ANesko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ANViewController : UIViewController{
    
    IBOutlet UILabel *myLabel;
    
}

-(IBAction)pressButton;

@property(nonatomic,retain) IBOutlet UILabel *myLabel;
@end
