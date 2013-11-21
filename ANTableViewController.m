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

@synthesize addTable;
@synthesize textInTable;

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
    self.textInTable=[NSArray arrayWithObjects:
                 @"text1",
                 @"text2 very very very long text with very very large number of words that should go to the third line",
                 @"text3",
                 nil];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *) tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section{
    return [textInTable count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.lineBreakMode=NSLineBreakByWordWrapping;
        cell.textLabel.numberOfLines=0;
    }
    cell.textLabel.text=[textInTable objectAtIndex:indexPath.row];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellText=[textInTable objectAtIndex:indexPath.row];
    UIFont *cellFont=[UIFont fontWithName:@"Helvetica-Bold" size:20.0f];
    CGSize constraintSize = CGSizeMake(320.0f, MAXFLOAT);
    CGRect size=[cellText boundingRectWithSize:constraintSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:cellFont}  context:nil];
    
    return size.size.height;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
