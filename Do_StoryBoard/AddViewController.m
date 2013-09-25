//
//  AddViewController.m
//  Do_StoryBoard
//
//  Created by Colin Yang Hong on 13-9-25.
//  Copyright (c) 2013年 Yang Hong. All rights reserved.
//

#import "AddViewController.h"
#import "AppDelegate.h"
#import "Student.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *text;
@property (weak, nonatomic) IBOutlet UITextField *detailText;
@property (weak, nonatomic) AppDelegate *myDelegate;

@end

@implementation AddViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)saveText:(id)sender
{
    Student *aStudent = (Student *)[NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:self.myDelegate.managedObjectContext];
    aStudent.name = _text.text;
    aStudent.serial = [NSNumber numberWithInt:rand()];
    aStudent.date = [NSDate date];
    aStudent.man = [NSNumber numberWithBool:YES];
    
    NSError *error;
    
    //托管对象准备好后，调用托管对象上下文的save方法将数据写入数据库
    BOOL isSaveSuccess = [self.myDelegate.managedObjectContext save:&error];
    
    if (!isSaveSuccess) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }else {
        NSLog(@"Save successful!");
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //获取当前应用程序的委托（UIApplication sharedApplication为整个应用程序上下文）
    self.myDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
