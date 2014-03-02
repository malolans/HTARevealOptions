//
//  HTAData.m
//  HTARevealOptions
//
//  Created by Malu on 3/1/14.
//  Copyright (c) 2014 Haptrix. All rights reserved.
//

#import "HTAData.h"

@implementation HTAData
- (id)initWith:(NSString *)aName andFullName:(NSString *)aFullName
{
    if(self = [super init]) {
        self.name = aName;
        self.fullName = aFullName;
    }
    
    return self;
}

+ (NSMutableArray *)getData
{
    NSMutableArray *characterData = [NSMutableArray array];
    
    [characterData addObject:[[HTAData alloc] initWith:@"Bender" andFullName:@"Bender Bending Rodríguez"]];
    [characterData addObject:[[HTAData alloc] initWith:@"Fry" andFullName:@"Philip J. Fry"]];
    [characterData addObject:[[HTAData alloc] initWith:@"Leela" andFullName:@"Turanga Leela"]];
    
    return characterData;
}

@end
