//
//  Todo.m
//  Labb3 ToDo
//
//  Created by Nicklas Pekkarinen on 2020-01-23.
//  Copyright © 2020 Nicklas Pekkarinen. All rights reserved.
//

#import "Todo.h"

@implementation Todo

- (instancetype)initWithName: (NSString*) name {
    
    self = [super init];
    
    if (self) {
        self.name = name;
        self.completed = NO;
    }
    
    return self;
}

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"todoName"];
    [coder encodeBool:self.completed forKey:@"todoCompleted"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    self = [super init];
    
    if (self) {
        self.name = [[coder decodeObjectForKey:@"todoName"] copy];
        self.completed = [coder decodeBoolForKey:@"todoCompleted"];
    }
    
    return self;
}

- (NSDictionary*) convertToDictionary {
    NSDictionary *todoDictionary = @{@"name":self.name, @"completed":[NSNumber numberWithBool:self.completed]};
    return todoDictionary;
}

@end
