//
//  MPIThemeInfo.h
//  
//
//  Created by Adam on 15/03/2022.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(ThemeInfo)
@interface MPIThemeInfo : NSObject

@property (nonatomic, readonly) NSUInteger version;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *identifier;
@property (nonatomic, readonly) NSString *author;

- (instancetype)initWithVersion:(NSUInteger)version
                           name:(NSString *)name
                     identifier:(NSString *)identifier
                         author:(NSString *)author;

@end

NS_ASSUME_NONNULL_END
