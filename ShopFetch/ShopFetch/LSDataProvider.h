//
//  LSDataProvider.h
//  ShopFetch
//
//  Created by Retina on 12.05.17.
//  Copyright © 2017 Sasha Haidar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSProductEntity+CoreDataClass.h"
#import "LSProductEntity+CoreDataProperties.h"

@interface LSDataProvider : NSObject

+ (instancetype)sharedInstance;

@end
