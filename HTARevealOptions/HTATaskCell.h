//
//  HTATaskCell.h
//  HTARevealOptions
//
//  Created by Malu on 3/1/14.
//  Copyright (c) 2014 Haptrix. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HTAData;

@interface HTATaskCell : UITableViewCell

@property (nonatomic, strong) UIView *nameView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIView *fullNameView;
@property (nonatomic, strong) UILabel *detialsLabel;
@property (nonatomic, strong) HTAData *cellData;

@end
