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

/// The version of the theme
///
/// The mechanism is very simple – increase the number if you want to use built-in mechanism for the updates
@property (nonatomic, readonly) NSUInteger version;

/// The name of the theme
///
/// This will be displayed in the NepTunes' preferences
@property (nonatomic, readonly) NSString *name;

/// unique id of the theme
///
/// reverse DNS notation is recommended, for example: com.software.NepTunes.Default
@property (nonatomic, readonly) NSString *identifier;

/// the full name of the author, for example: Adam Różyński
@property (nonatomic, readonly) NSString *author;

- (instancetype)initWithVersion:(NSUInteger)version
                           name:(NSString *)name
                     identifier:(NSString *)identifier
                         author:(NSString *)author;

- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
