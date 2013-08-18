//
//  RestaurantData.h
//  RandomLunch
//
//  Created by Park Yoseop on 13. 8. 13..
//  Copyright (c) 2013년 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestaurantData : NSObject
{
	NSInteger rIndex;
	NSString *rName;
	NSString *rNumber;
	NSString *rMemo;
}

@property (nonatomic, assign) NSInteger rIndex;
@property (nonatomic, retain) NSString *rName;
@property (nonatomic, retain) NSString *rNumber;
@property (nonatomic, retain) NSString *rMemo;

- (id)initWithData:(NSInteger)Index Title:(NSString*)Name Content:(NSString*)Number Date:(NSString*)Memo;

@end
