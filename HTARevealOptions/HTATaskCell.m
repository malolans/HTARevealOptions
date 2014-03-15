//
//  HTATaskCell.m
//  HTARevealOptions
//
//  Created by Malu on 3/1/14.
//  Copyright (c) 2014 Haptrix. All rights reserved.
//

#import "HTATaskCell.h"
#import "HTAData.h"

@interface HTATaskCell()

@property (nonatomic, strong) UIView *bottomBar;

@end

@implementation HTATaskCell

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initSubView];
        [self iniBottomBar];
    }
    return self;
}

- (void)iniBottomBar
{
    CGRect cellFrame = self.frame;
    CGRect frameRect = CGRectMake(0.0, cellFrame.size.height - 0.5, cellFrame.size.width, 0.5);
    self.bottomBar = [[UIView alloc] initWithFrame:frameRect];
    self.bottomBar.backgroundColor = [UIColor colorWithWhite:0.8f
                                                       alpha:1.0f];
    [self.contentView addSubview:self.bottomBar];
}

- (void)initSubView
{
    CGRect cellFrame = self.bounds;
    
    CGRect frame = CGRectMake(0.0, 0.0, cellFrame.size.width, cellFrame.size.height);
    self.nameView = [[UIView alloc] initWithFrame:frame];
    CGRect labelFrame = CGRectMake(0, 0, 0, 0);
    self.nameLabel = [[UILabel alloc] initWithFrame:labelFrame];
    [self.nameView addSubview:self.nameLabel];
    [self.contentView addSubview:self.nameView];
    
    frame = CGRectMake(0.0, cellFrame.size.height, cellFrame.size.width, cellFrame.size.height);
    self.fullNameView = [[UIView alloc] initWithFrame:frame];
    self.fullNameView.backgroundColor = [UIColor colorWithWhite:0.6f
                                                          alpha:1.0f];
    self.detialsLabel = [[UILabel alloc] initWithFrame:labelFrame];
    [self.fullNameView addSubview:self.detialsLabel];
    [self.contentView addSubview:self.fullNameView];
    
    self.fullNameView.hidden = YES;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect bottomBarPostion;
    
    self.nameLabel.frame = CGRectMake(15, 0, 290, 44);
    self.detialsLabel.frame = self.nameLabel.frame;
    
    if (!self.cellData.isSelected) {
        self.fullNameView.hidden = YES;
        bottomBarPostion = CGRectMake(0.0, self.nameView.bounds.size.height - 0.5, self.bounds.size.width, 0.5);
    } else {
        bottomBarPostion = CGRectMake(0.0, self.bounds.size.height - 0.5, self.bounds.size.width, 0.5);
        self.fullNameView.hidden = NO;
    }
    
    self.bottomBar.frame = bottomBarPostion;
}

@end
