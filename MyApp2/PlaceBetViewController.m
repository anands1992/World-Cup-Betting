//
//  PlaceBetViewController.m
//  MyApp2
//
//  Created by qbadmin on 16/06/14.
//  Copyright (c) 2014 qbadmin. All rights reserved.
//

#import "PlaceBetViewController.h"

@interface PlaceBetViewController ()

@end

static int a,b,c;

@implementation PlaceBetViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)radiobutton1select:(id)sender
{
    [_radiobutton1 setSelected:YES];
    
    [_radiobutton1 setImage:[UIImage imageNamed:@"RadioButton-Selected.png"]forState:UIControlStateSelected];
    [_radiobutton2 setImage:[UIImage imageNamed:@"RadioButton-Unselected.png"]forState:UIControlStateSelected];
    [_radiobutton3 setImage:[UIImage imageNamed:@"radioButton-Unselected.png"]forState:UIControlStateSelected];
}

-(IBAction)radiobutton2select:(id)sender
{
    [_radiobutton2 setSelected:YES];
    
    [_radiobutton2 setImage:[UIImage imageNamed:@"RadioButton-Selected.png"]forState:UIControlStateSelected];
    [_radiobutton1 setImage:[UIImage imageNamed:@"radioButton-Unselected.png"]forState:UIControlStateSelected];
    [_radiobutton3 setImage:[UIImage imageNamed:@"radioButton-Unselected.png"]forState:UIControlStateSelected];
}

-(IBAction)radiobutton3select:(id)sender
{
    [_radiobutton3 setSelected:YES];
    
    [_radiobutton3 setImage:[UIImage imageNamed:@"RadioButton-Selected.png"]forState:UIControlStateSelected];
    [_radiobutton2 setImage:[UIImage imageNamed:@"radioButton-Unselected.png"]forState:UIControlStateSelected];
    [_radiobutton1 setImage:[UIImage imageNamed:@"radioButton-Unselected.png"]forState:UIControlStateSelected];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    _radiobutton1=nil;
    _radiobutton2=nil;
    _radiobutton3=nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (IBAction)placebet:(id)sender
{
    if ([_radiobutton1 isSelected] && [_placebet isSelected])
    {
        a++;
    }
    else if ([_radiobutton2 isSelected] && [_placebet isSelected])
    {
        b++;
    }
    else if ([_radiobutton3 isSelected] && [_placebet isSelected])
    {
        c++;
    }
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
