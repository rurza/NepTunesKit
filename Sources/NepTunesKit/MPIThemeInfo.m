//
//  MPIThemeInfo.m
//  
//
//  Created by Adam on 15/03/2022.
//

#import "MPIThemeInfo.h"

@interface MPIThemeInfo ()
@property (nonatomic) NSUInteger version;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *identifier;
@property (nonatomic) NSString *author;
@end

@implementation MPIThemeInfo

- (instancetype)initWithVersion:(NSUInteger)version
                           name:(NSString *)name
                     identifier:(NSString *)identifier
                         author:(NSString *)author {
    self = [super init];
    self.version = version;
    self.name = name;
    self.identifier = identifier;
    self.author = author;
}

@end
