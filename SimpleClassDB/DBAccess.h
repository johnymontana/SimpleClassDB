//
//  DBAccess.h
//  SimpleClassDB
//
//  Created by William Lyon on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <sqlite3.h>
#import "SCDBClass.h"

@interface DBAccess : NSObject
{
    
}

- (NSMutableArray*) getAllClasses;
- (void) closeDatabase;
- (void) initializeDatabase;

@end
