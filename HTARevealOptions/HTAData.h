//
//  HTAData.h
//  HTARevealOptions
//
//  Created by Malu on 3/1/14.
//  Copyright (c) 2014 Haptrix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTAData : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, assign) BOOL isSelected;

- (id)initWith:(NSString *)aName andFullName:(NSString *)aFullName;

+ (NSMutableArray *)getData;
@end
