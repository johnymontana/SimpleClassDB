//
//  SCDBDetailViewController.h
//  SimpleClassDB
//
//  Created by William Lyon on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SCDBClass.h"


@interface SCDBDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *buildingLabel;
@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *roomLabel;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

-(void) setLabelsForProduct: (SCDBClass*) theClass;
@end
