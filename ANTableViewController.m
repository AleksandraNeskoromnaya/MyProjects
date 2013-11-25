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
@synthesize toolBar;

-(void)addNew{
    [textInTable addObject:@"New text"];
    [addTable reloadData];
}

-(IBAction)editItem:(id)sender{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Edit Item" message:@"Replace Text" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Save", nil];
    alert.alertViewStyle=UIAlertViewStylePlainTextInput;
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex != [alertView cancelButtonIndex]) {
        NSString *inputstring = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0] text]];
        [textInTable addObject:inputstring];
        [addTable reloadData];
    }
}

-(void)editing{
    [self.addTable setEditing:!self.addTable.editing animated:YES];
}

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
    [self createToolbar];
    self.title=@"Table";
    self.textInTable=[NSMutableArray arrayWithObjects:
                 @"text1",
                 @"text2 very very very long text with very very large number of words that should go to the third line",
                 @"text3",
                 nil];
    UIBarButtonItem *editLineButton=[[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleBordered target:self action:@selector(editItem:)];
    [self.navigationItem setRightBarButtonItem:editLineButton];
}

-(void)createToolbar{
  UIBarButtonItem *addButton =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNew)];
    UIBarButtonItem *editButton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(editing)];
    NSArray *buttonItems=[NSArray arrayWithObjects:addButton, editButton, nil];
    [toolBar setItems:buttonItems];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *) tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section{
    return [textInTable count];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
        return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle==UITableViewCellEditingStyleDelete)
    {[textInTable removeObjectAtIndex:indexPath.row];
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];
        
    }
    }

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}


-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    [textInTable exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
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
