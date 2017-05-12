//
//  LSProductCell.m
//  ShopFetch
//
//  Created by aleksandr on 12.05.17.
//  Copyright © 2017 Sasha Haidar. All rights reserved.
//

#import "LSProductCell.h"

@implementation LSProductCell

- (void)updateModel:(LSProduct*)model {
    self.nameLabel.text = model.name;
    self.costLabel.text = model.cost;
    self.photoImageView.image = [UIImage imageNamed:model.imageName];
}

@end
