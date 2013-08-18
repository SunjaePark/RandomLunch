//
//  RestaurantData.h
//  RandomLunch
//
//  Created by Park Yoseop on 13. 8. 13..
//  Copyright (c) 2013년 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestaurantData : NSObject

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *number;
@property (nonatomic, strong) NSString *memo;

- (id)initWithData:(NSInteger)index name:(NSString*)name number:(NSString*)number memo:(NSString*)memo;

@end
