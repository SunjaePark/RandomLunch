//
//  RestaurantData.m
//  RandomLunch
//
//  Created by Park Yoseop on 13. 8. 13..
//  Copyright (c) 2013년 Heaven. All rights reserved.
//

#import "RestaurantData.h"

@implementation RestaurantData

- (id)initWithData:(NSInteger)Index Title:(NSString*)Name Content:(NSString*)Number Date:(NSString*)Memo {
	
    self.rIndex = Index;
    self.rName = Name;
    self.rNumber = Number;
    self.rMemo = Memo;
    
	return self;
}

@end
