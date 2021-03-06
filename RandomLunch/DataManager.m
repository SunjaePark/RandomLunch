//
//  DataManager.m
//  RandomLunch
//
//  Created by Park Yoseop on 13. 8. 20..
//  Copyright (c) 2013년 Heaven. All rights reserved.
//

#import "DataManager.h"
// TODO: RestaurantData 관련 코드 제거
#import "RestaurantData.h" //allRowFromTable에서 바로 restaurantData 가져오려고.
#import <sqlite3.h>

@implementation DataManager

static DataManager *instance = nil;

+ (DataManager *)defaultManager
{
	@synchronized( [DataManager class] ) {
        if( instance == nil )
            instance = [[self class] new];
        
        return instance;
    }
    return nil;
}

- (id)init
{
    if ( self = [super init] ) {
        [self openDB];
    }
    return self;
}

- (NSString *) filePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    return [documentsDir stringByAppendingPathComponent:@"database.sql"];
}

- (void) openDB
{
    //데이터베이스 생성
    if (sqlite3_open([[self filePath] UTF8String], &db) != SQLITE_OK){
        NSLog(@"Opened sqlite database at %@", self.filePath);
        sqlite3_close(db);
        NSAssert(0, @"Database failed to open.");
    }
}

- (void) createTableNamed:(NSString *) tableName withField1:(NSString *) field1 field2:(NSString *) field2 field3:(NSString *) field3
{
    char *err;
    //SQL문
    NSString *sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@' ( '%@' TEXT PRIMARY KEY, '%@' TEXT, '%@' TEXT);", tableName, field1, field2, field3];
    
    if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) !=SQLITE_OK)
    {
        sqlite3_close(db);
        NSAssert(0, @"Tabled failed to create.");
    }
}

- (void) insertRecordIntoTableNamed:(NSString *) tableName
                         withField1:(NSString *) field1
                             field2:(NSString *) field2
                             field3:(NSString *) field3
                        field1Value:(NSString *) field1Value
                        field2Value:(NSString *) field2Value
                        field3Value:(NSString *) field3Value
{
    //SQL문
    NSString *sql = [NSString stringWithFormat:@"INSERT OR REPLACE INTO '%@' ('%@','%@','%@') VALUES ('%@','%@','%@')", tableName,field1, field2,field3,field1Value,field2Value,field3Value ];
    
    char *err;
    if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK)
    {
        sqlite3_close(db);
        NSAssert(0, @"Error Updating Table.");
    }
}

- (NSMutableArray *) allRowsFromTableNamed: (NSString *)tableName
{
    NSMutableArray *tableRow = [NSMutableArray new];
    //열가져오기.
    NSLog(@"tableName : %@", tableName);
    NSString *qsql = [NSString stringWithFormat:@"SELECT * FROM %@",tableName];
    NSLog(@"qsql : %@", qsql);
    sqlite3_stmt *statement;
    
    if (sqlite3_prepare_v2(db, [qsql UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        while(sqlite3_step(statement) == SQLITE_ROW)
        {
            NSString *field1Str = [NSString stringWithUTF8String:(char *) sqlite3_column_text(statement, 0)];
            NSString *field2Str = [NSString stringWithUTF8String:(char *) sqlite3_column_text(statement, 1)];
            NSString *field3Str = [NSString stringWithUTF8String:(char *) sqlite3_column_text(statement, 2)];
            
            // TODO: Raw Data로 정리하여 반환
            RestaurantData *restaurant = [[RestaurantData alloc]initWithIndex:tableRow.count
                                                                         name:field1Str
                                                                       number:field2Str
                                                                         memo:field3Str];
            [tableRow addObject:restaurant];
            NSString *str = [[NSString alloc] initWithFormat:@"In while loop, %@ - %@ - %@ ",field1Str, field2Str, field3Str];
            NSLog(@"%@", str);
        }
        
        // 메모리에 쌓인 쿼리문 삭제
        sqlite3_finalize(statement);
    }
    
    return tableRow;
}

@end
