//
//  MPIThemeWindow.h
//  
//
//  Created by Adam on 15/03/2022.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(ThemeWindow)
@interface MPIThemeWindow : NSWindow

- (instancetype)initWithIdentifier:(NSString * _Nonnull)identifier NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithContentRect:(NSRect)contentRect
                          styleMask:(NSWindowStyleMask)style
                            backing:(NSBackingStoreType)backingStoreType
                              defer:(BOOL)flag NS_UNAVAILABLE;

- (instancetype)initWithContentRect:(NSRect)contentRect
                          styleMask:(NSWindowStyleMask)style
                            backing:(NSBackingStoreType)backingStoreType
                              defer:(BOOL)flag
                             screen:(nullable NSScreen *)screen NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
