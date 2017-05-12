//
//  LSDataProvider.m
//  Shop
//
//  Created by Artem Kravchenko on 5/12/17.
//  Copyright © 2017 LemonSchool. All rights reserved.
//

#import "LSDataProvider.h"

#import <MagicalRecord/MagicalRecord.h>

@implementation LSDataProvider


+ (instancetype)sharedInstance {
    static LSDataProvider *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [LSDataProvider new];
        [MagicalRecord setupCoreDataStack];
        [instance firstUpload];
    });
    return instance;
}

- (NSArray*)allProducts {
    return [LSProductEntity MR_findAllInContext:[NSManagedObjectContext MR_rootSavingContext]];
}

- (void)firstUpload {
    if ([LSProductEntity MR_findAll].count == 0) {
        NSManagedObjectContext *context = [NSManagedObjectContext MR_rootSavingContext];
        NSInteger amount = self.phoneNames.count;
        for (int i = 0; i < amount; i++) {
            LSProductEntity *product = [LSProductEntity MR_createEntityInContext:context];
            product.productID = [[NSProcessInfo processInfo] globallyUniqueString];
            product.name = self.phoneNames[i];
            product.cost = self.prices[i];
            product.imageName = self.imageNames[i];
        }
        [context MR_saveToPersistentStoreAndWait];
    }
}

- (NSArray *)phoneNames {
    return @[
             @"Huawei P10 4/32GB Black + УМБ 10000 мАч!",
             @"LeEco Le Max 2 (4/64GB) Gray",
             @"Sony Xperia XA Dual (F3112) Black",
             @"Nous NS 5006 Rose Gold",
             @"Apple iPhone 7 Plus 128GB Silver",
             @"Motorola Moto Z Play (XT1635-02) Gold-White",
             @"ZTE Axon 7 Grey",
             @"Lenovo P2 (P2a42) Dark Grey",
             @"Motorola MOTO G4 Plus (XT1642) White",
             @"Samsung Galaxy S7 Edge 32GB Blue"
             ];
}

- (NSArray*)prices {
    return @[
             @"10 999",
             @"8 888",
             @"4 999",
             @"2 799",
             @"29 999",
             @"12 995",
             @"15 999",
             @"9 995",
             @"7 495",
             @"19 999"
             ];
}

- (NSArray*)imageNames {
    return @[
             @"huawei_p10.jpg",
             @"leeco_le_max_2_4.jpg",
             @"sony_xperia_xa_dual_black.jpg",
             @"nous_ns_5006_rose_gold.jpg",
             @"apple_iphone_7_plus_128gb_silver.jpg",
             @"motorola_sm.jpg",
             @"zte_axon7_grey_57.jpg",
             @"lenovo_pa4.jpg",
             @"motorola_sm4377ad1k7.jpg",
             @"samsung_galaxy_s7_edge_32gb.jpg"
             ];
}

@end
