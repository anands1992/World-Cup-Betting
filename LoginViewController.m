//
//  LoginViewController.m
//  MyApp2
//
//  Created by qbadmin on 16/06/14.
//  Copyright (c) 2014 qbadmin. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    self.password.secureTextEntry = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == self.username)
        [self.password becomeFirstResponder];
    else
        [ self login:nil];
    return YES;
}

-(IBAction)login:(id)sender
{
    
    if([self.username.text isEqualToString:@"user"] && [self.password.text isEqualToString:@"qburst"])
    {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isLoggedIn"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [self dismissViewControllerAnimated:NO completion:nil];
    }
    else if([self.username.text isEqualToString:@""])
    {
        [self showAlert2];
    }
    else if([self.password.text isEqualToString:@""])
    {
        [self showAlert2];
    }
    else
        [self showAlert1];
    
}
- (void) showAlert1
{
    
    UIAlertView *alert = [[UIAlertView alloc]
                          
                          initWithTitle:@"Error!"
                          message:@"Your Entry is Incorrect"
                          delegate:nil
                          cancelButtonTitle:@"Dismiss"
                          otherButtonTitles:nil];
    
    [alert show];
}

- (void) showAlert2
{
    
    UIAlertView *alert = [[UIAlertView alloc]
                          
                          initWithTitle:@"Error!"
                          message:@"Missing Field"
                          delegate:nil
                          cancelButtonTitle:@"Dismiss"
                          otherButtonTitles:nil];
    
    [alert show];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
