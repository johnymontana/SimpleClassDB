//
//  DBAccess.m
//  SimpleClassDB
//
//  Created by William Lyon on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DBAccess.h"

@implementation DBAccess
sqlite3* database;

-(id) init
{
    if ((self = [super init]))
    {
        [self initializeDatabase];
    }
    
    return self;
}

- (void)initializeDatabase {
    
    // Get the database from the application bundle. 
    NSString *path = [[NSBundle mainBundle] pathForResource:@"simpleclasses" 
                                                     ofType:@"db"];
    
    // Open the database. 
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) 
    {
        NSLog(@"Opening Database");
    } 
    else 
    {
        // Call close to properly clean up 
        sqlite3_close(database);
        NSAssert1(0, @"Failed to open database: '%s'.", 
                  sqlite3_errmsg(database));
    }
}

-(void) closeDatabase
{
    // Close the database.
    if (sqlite3_close(database) != SQLITE_OK) {
        NSAssert1(0, @"Error: failed to close database: '%s'.", 
                  sqlite3_errmsg(database));
    }
}


- (NSMutableArray*) getAllClasses
{
    //  The array of products that we will create
    NSMutableArray *classes = [[NSMutableArray alloc] init];
    
    //  The SQL statement that we plan on executing against the database
    const char *sql = "SELECT * FROM Class";
    
    //  The SQLite statement object that will hold our result set
    sqlite3_stmt *statement;
    
    // Prepare the statement to compile the SQL query into byte-code 
    int sqlResult = sqlite3_prepare_v2(database, sql, -1, &statement, NULL);
	
    if ( sqlResult== SQLITE_OK) {
        // Step through the results - once for each row.
        while (sqlite3_step(statement) == SQLITE_ROW) {
            //  allocate a Product object to add to products array
            SCDBClass  *myClass = [[SCDBClass alloc] init];
            
            // The second parameter is the column index (0 based) in 
            // the result set.
            char *name = (char *)sqlite3_column_text(statement, 1);
            char *school = (char *)sqlite3_column_text(statement, 2);
            char *details = (char *)sqlite3_column_text(statement, 4);
            char *building = (char *)sqlite3_column_text(statement, 5);
            //char *image = (char *)sqlite3_column_text(statement, 7);
            
            
            //  Set all the attributes of the product
            myClass.ID = sqlite3_column_int(statement, 0);
            myClass.name = (name) ? [NSString stringWithUTF8String:name] : @"";
            myClass.school = 
            (school) ? [NSString 
                              stringWithUTF8String:school] : @"";
            myClass.details = (details) ? [NSString 
                                           stringWithUTF8String:details] : @"";
            myClass.number = sqlite3_column_double(statement, 3);
            myClass.room = sqlite3_column_int(statement, 6);
            //product.countryOfOrigin = 
            //(countryOfOrigin) ? [NSString
            //                     stringWithUTF8String:countryOfOrigin] : @"";
            //product.image = (image) ? [NSString 
            //                           stringWithUTF8String:image] : @"";
            
            
            [classes addObject:myClass];
           // [myClass release];
        }
        
        // finalize the statement to release its resources
        sqlite3_finalize(statement);
    }
    else {
        NSLog(@"Problem with the database:");
        NSLog(@"%d",sqlResult);
    }   
    
    return classes;
    
}


@end
