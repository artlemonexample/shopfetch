//
//  LSProductEntity+CoreDataProperties.m
//  ShopFetch
//
//  Created by aleksandr on 12.05.17.
//  Copyright © 2017 Sasha Haidar. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "LSProductEntity+CoreDataProperties.h"

@implementation LSProductEntity (CoreDataProperties)

+ (NSFetchRequest<LSProductEntity *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"LSProductEntity"];
}

@dynamic name;
@dynamic cost;
@dynamic imageName;
@dynamic productID;

@end
