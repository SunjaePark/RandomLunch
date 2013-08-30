//
//  RestaurantController.m
//  RandomLunch
//
//  Created by Heaven on 13. 8. 29..
//  Copyright (c) 2013년 Heaven. All rights reserved.
//

#import "RestaurantController.h"
#import "DataManager.h"
#import "RestaurantData.h"

@interface RestaurantController ()

@end

@implementation RestaurantController

static RestaurantController *instance = nil;

+ (RestaurantController *)sharedInstance
{
    @synchronized( [RestaurantController class] ) {
        if( instance == nil )
            instance = [[self class] new];
        
        return instance;
    }
    return nil;
}

- (id)init
{
    if ( self = [super init] ) {
        [self prepareRestaurantDataManager];
    }
    return self;
}

- (void)prepareRestaurantDataManager
{
    [[DataManager defaultManager] createTableNamed:TABLE_RESTAURANT withField1:FIELD_NAME
                                            field2:FIELD_NUMBER field3:FIELD_MEMO];
}

- (void)addRestaurant:(RestaurantData *)restaurant
{
    [[DataManager defaultManager] insertRecordIntoTableNamed:TABLE_RESTAURANT
                                                  withField1:FIELD_NAME
                                                      field2:FIELD_NUMBER
                                                      field3:FIELD_MEMO
                                                 field1Value:restaurant.name
                                                 field2Value:restaurant.number
                                                 field3Value:restaurant.memo];
}

- (NSArray *)allRestaurant
{
    NSArray *restaurants = nil;
    
    //NSArray *rawResult = [[DataManager defaultManager] allRowsFromTableNamed:TABLE_RESTAURANT];
    
    // Raw Data to Restaurant Data
    
    return restaurants;
}

@end
