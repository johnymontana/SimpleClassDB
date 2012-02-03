//
//  SCDBClass.h
//  SimpleClassDB
//
//  Created by William Lyon on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCDBClass : NSObject
{
    int ID;
    NSString* name;
    NSString* school;
    int number;
    NSString* details;
    NSString* building;
    int room;

}

@property (nonatomic) int ID;
@property (retain, nonatomic) NSString *name;
@property (retain, nonatomic) NSString *school;
@property (nonatomic) int number;
@property (retain, nonatomic) NSString *details;
@property (retain, nonatomic) NSString *building;
@property (nonatomic) int room;

@end
