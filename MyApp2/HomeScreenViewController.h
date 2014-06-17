//
//  HomeScreenViewController.h
//  MyApp2
//
//  Created by qbadmin on 16/06/14.
//  Copyright (c) 2014 qbadmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeScreenViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,NSURLConnectionDataDelegate>
{
    NSMutableData *_responseData;
}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *Logout;
@property (weak, nonatomic) IBOutlet UILabel *matchday;
@property (weak, nonatomic) IBOutlet UITableView *fixture;
@end
