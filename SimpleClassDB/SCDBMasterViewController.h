//
//  SCDBMasterViewController.h
//  SimpleClassDB
//
//  Created by William Lyon on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SCDBClass.h"
#import "DBAccess.h"
#import "SCDBDetailViewController.h"

@class SCDBDetailViewController;

@interface SCDBMasterViewController : UITableViewController
{
    NSMutableArray *classes;
}
@property (retain, nonatomic) NSMutableArray* classes;
@property (strong, nonatomic) SCDBDetailViewController *detailViewController;

@end
