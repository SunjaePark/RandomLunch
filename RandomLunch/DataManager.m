//
//  DataManager.m
//  RandomLunch
//
//  Created by Park Yoseop on 13. 8. 20..
//  Copyright (c) 2013년 Heaven. All rights reserved.
//

#import "DataManager.h"
#import <sqlite3.h>

@implementation DataManager

- (NSString *) filePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
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

- (void) insertRecordIntoTableNamed:(NSString *) tableName withField1:(NSString *) field1 field2:(NSString *) field2 field3:(NSString *) field3 field1Value:(NSString *) field1Value field2Value:(NSString *) field2Value field3Value:(NSString *) field3Value
{
    //SQL문
    NSString *sql = [NSString stringWithFormat:@"INSERT OR REPLACE INTO '%@' ('%@','%@','%@') VALUES ('%@','%@','%@')", tableName,field2, field2,field3,field1Value,field2Value,field3Value ];
    
    char *err;
    if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK)
    {
        sqlite3_close(db);
        NSAssert(0, @"Error Updating Table.");
    }
}

- (void) allRowsFromTableNamed: (NSString *) tableName
{
    //열가져오기.
    NSString *qsql = [NSString stringWithFormat:@"SELECT * FROM %@",tableName];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(db, [qsql UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        while(sqlite3_step(statement) == SQLITE_ROW)
        {
            char *field1 = (char *) sqlite3_column_text(statement, 0);
            NSLog(@"field1 : %@",field1);
            
            NSString *field1Str = [[NSString alloc] initWithUTF8String:field1];
            char *field2 = (char *) sqlite3_column_text(statement, 1);
            NSString *field2Str = [[NSString alloc] initWithUTF8String:field2];
            char *field3 = (char *) sqlite3_column_text(statement, 2);
            NSString *field3Str = [[NSString alloc] initWithUTF8String:field3];
            
            NSString *str = [[NSString alloc] initWithFormat:@" %@ - %@ - %@ ", field1Str, field2Str, field3Str];
            NSLog(@"%@", str);
        }
        // 메모리에 쌓인 쿼리문 삭제
        sqlite3_finalize(statement);
    }
}

@end
