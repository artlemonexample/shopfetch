//
//  LSProduct.m
//  Shop
//
//  Created by Artem Kravchenko on 5/12/17.
//  Copyright © 2017 LemonSchool. All rights reserved.
//

#import "LSProduct.h"

@implementation LSProduct

- (void)fillEntityFromModel:(LSProductEntity*)entity {
    entity.productID = [self.productID copy];
    entity.imageName = [self.imageName copy];
    entity.cost = [self.cost copy];
    entity.name = [self.name copy];
}

+ (LSProduct*)productFromEntity:(LSProductEntity*)entity {
    LSProduct *product = [LSProduct new];
    product.productID = [entity.productID copy];
    product.imageName = [entity.imageName copy];
    product.cost = [entity.cost copy];
    product.name = [entity.name copy];
    return product;
}

@end
