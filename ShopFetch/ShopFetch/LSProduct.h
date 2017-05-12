//
//  LSProduct.h
//  ShopFetch
//
//  Created by Retina on 12.05.17.
//  Copyright © 2017 Sasha Haidar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSProduct : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *cost;
@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) NSString *productID;

@end
