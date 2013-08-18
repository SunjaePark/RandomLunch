//
//  RestaurantData.m
//  RandomLunch
//
//  Created by Park Yoseop on 13. 8. 13..
//  Copyright (c) 2013년 Heaven. All rights reserved.
//

#import "RestaurantData.h"

@implementation RestaurantData

- (id)initWithData:(NSInteger)index name:(NSString*)name number:(NSString*)number memo:(NSString*)memo
{
	
    if (self = [super init]) {
        self.index = index;
        self.name = name;
        self.number = number;
        self.memo = memo;
    }
    
	return self;
}

@end
