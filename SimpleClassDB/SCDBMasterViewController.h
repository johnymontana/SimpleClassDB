//
//  SCDBMasterViewController.h
//  SimpleClassDB
//
//  Created by William Lyon on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SCDBDetailViewController;

@interface SCDBMasterViewController : UITableViewController

@property (strong, nonatomic) SCDBDetailViewController *detailViewController;

@end
