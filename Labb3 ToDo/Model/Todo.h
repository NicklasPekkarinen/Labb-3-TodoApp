//
//  Todo.h
//  Labb3 ToDo
//
//  Created by Nicklas Pekkarinen on 2020-01-23.
//  Copyright © 2020 Nicklas Pekkarinen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Todo : NSObject <NSCoding>

- (instancetype)initWithName:(NSString*) name;
- (NSDictionary*) convertToDictionary;

@property (nonatomic) NSString *name;
@property (nonatomic) BOOL completed;

@end

NS_ASSUME_NONNULL_END
