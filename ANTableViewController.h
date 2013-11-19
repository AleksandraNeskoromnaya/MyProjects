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
    NSArray *textInTable;
}

@property(nonatomic,retain)IBOutlet UITableView *addTable;
@property(nonatomic,retain)NSArray *textInTable;

@end
