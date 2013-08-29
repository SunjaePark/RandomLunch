//
//  DataManager.h
//  RandomLunch
//
//  Created by Park Yoseop on 13. 8. 20..
//  Copyright (c) 2013년 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@class Memo;

@interface DataManager : NSObject
{
    sqlite3 *db;
}

+ (DataManager *)defaultManager;

//데이터베이스의 전체 경로 반환
- (NSString *) filePath;

//데이터베이스 생성
- (void) openDB;

//테이블 생성
- (void) createTableNamed:(NSString *) tableName withField1:(NSString *) field1 field2:(NSString *) field2 field3:(NSString *) field3;

//레코드 삽입
- (void) insertRecordIntoTableNamed:(NSString *) tableName withField1:(NSString *) field1 field2:(NSString *) field2 field3:(NSString *) field3 field1Value:(NSString *) field1Value field2Value:(NSString *) field2Value field3Value:(NSString *) field3Value;

//레코드 가져오기
- (NSMutableArray *) allRowsFromTableNamed: (NSString *)tableName;


//+ (id)defaultManager;
//
//// 아래와 같은 형태로 각각을 입력 받도록 구성할 수도 있고
//// 아니면 - (void)insertWithDictionary:(NSDictionary)dictionary 와 같이 범용적으로 사용할 수 있도록 구성 할 수도 있을 것 같습니다.
//// 이외의 다른 형태로도 고민해 보시면 좋을 것 같네요.
//
//- (void)insertWithTitle:(NSString *)title memo:(NSString *)memo;
//- (void)updateWithTitle:(NSString *)title memo:(NSString *)memo where:(int)indexNumber;
//- (NSArray *)memoList;

@end
