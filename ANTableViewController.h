//
//  ANTableViewController.h
//  MyProject2
//
//  Created by Admin on 17.11.13.
//  Copyright (c) 2013 ANesko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ANTableViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *addTable;
    NSMutableArray *textInTable;
}
-(void)addNew;
-(IBAction)editItem:(id)sender;

@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

@property(nonatomic,retain)IBOutlet UITableView *addTable;
@property(nonatomic,retain)NSMutableArray *textInTable;

@end
