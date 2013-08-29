//
//  RestaurantController.h
//  RandomLunch
//
//  Created by Heaven on 13. 8. 29..
//  Copyright (c) 2013년 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TABLE_RESTAURANT    @"restaurant"
#define FIELD_NAME          @"name"
#define FIELD_NUMBER        @"number"
#define FIELD_MEMO          @"memo"

@class RestaurantData;

@interface RestaurantController : NSObject

+ (RestaurantController *)sharedInstance;
- (void)addRestaurant:(RestaurantData *)restaurant;
- (NSArray *)allRestaurant;

@end
