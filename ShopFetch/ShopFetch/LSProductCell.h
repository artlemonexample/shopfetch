//
//  LSProductCell.h
//  ShopFetch
//
//  Created by aleksandr on 12.05.17.
//  Copyright © 2017 Sasha Haidar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSProductCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *costLabel;

@end
