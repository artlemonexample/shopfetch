//
//  LSProductEntity+CoreDataProperties.h
//  ShopFetch
//
//  Created by aleksandr on 12.05.17.
//  Copyright © 2017 Sasha Haidar. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "LSProductEntity+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface LSProductEntity (CoreDataProperties)

+ (NSFetchRequest<LSProductEntity *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *cost;
@property (nullable, nonatomic, copy) NSString *imageName;
@property (nullable, nonatomic, copy) NSString *productID;

@end

NS_ASSUME_NONNULL_END
