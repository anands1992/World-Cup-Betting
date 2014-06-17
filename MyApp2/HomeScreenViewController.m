//
//  HomeScreenViewController.m
//  MyApp2
//
//  Created by qbadmin on 16/06/14.
//  Copyright (c) 2014 qbadmin. All rights reserved.
//

#import "HomeScreenViewController.h"
#import "Fixturecell.h"

@interface HomeScreenViewController ()

@end

NSArray *item1,*item2;
int i, rounds;
NSDate *date;
NSDateFormatter *dateformat;
NSString *datestring;
NSInteger day;

@implementation HomeScreenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    rounds++;
    NSDate *today = [NSDate date];
    dateformat = [[NSDateFormatter alloc] init];
    [dateformat setDateFormat:@"dd/MM/yyyy"];
    datestring = [dateformat stringFromDate:today];
    NSLog(@"date: %@", datestring);
    
    NSArray *arr_my = [datestring componentsSeparatedByString:@"-"];
    
    day = [[arr_my objectAtIndex:0] intValue];
    [self callAPI];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)Logout:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isLoggedIn"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self performSegueWithIdentifier:@"Modal" sender:self];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"isLoggedIn"])
    {
        
    }
    else
    {
        [self performSegueWithIdentifier:@"Modal" sender:self];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return item1.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"Cell1";
    
    Fixturecell *cell = (Fixturecell*)
    [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil)
    {
        cell = [[Fixturecell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
   
    i=indexPath.row;
    
    NSLog(@"%@",item1);
    
    NSLog(@"%@",item2);
    
    self.matchday.text = @"HI";
    cell.team1.text = [[item1 objectAtIndex:i]objectForKey:@"team1_title"];
    cell.team2.text = [[item1 objectAtIndex:i]objectForKey:@"team2_title"];
   
    return cell;
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _responseData =[[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_responseData appendData:data];
    [self fetchedData:_responseData];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse
{
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
}

- (void)fetchedData:(NSData *)responseData
{
    //parse out the json data
    NSError* error;

    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          
                          options:kNilOptions
                          error:&error];
    item1 = [json objectForKey:@"games"];
    item2 = [json objectForKey:@"round"];
    [self.fixture reloadData];
   
}

- (void)callAPI
{
    NSLog(@"%d",day);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://footballdb.herokuapp.com/api/v1/event/world.2014/round/%d",(day - 11)]]];
    // Create url connection and fire request
    [NSURLConnection connectionWithRequest:request delegate:self];
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
