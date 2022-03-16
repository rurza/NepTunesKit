//
//  MPITheme.h
//  
//
//  Created by Adam on 15/03/2022.
//

@import Foundation;
#import "IPC.h"
#import "MPIThemeWindowBehavior.h"

@class MPIThemeInfo;
@class MPIThemeWindow;
@class MPICurrentPlayerState;

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(Theme)
@interface MPITheme : NSObject

/// object representing the app
@property (nonatomic) id<MPIWidgetApp> widget;

/// should return info used for theme info
- (MPIThemeInfo *)info;

/// .stuck by default
- (MPIThemeWindowBehavior)defaultThemeWindowBehavior;

/// by default will return a new `MPIThemeWindow` instance with the identifier from the `MPIThemeInfo`
- (MPIThemeWindow *)themeWindow;

/// the default implementation does nothing
/// @param newState containg info about the app and the current trakc (which can be nil)
- (void)stateDidChange:(MPICurrentPlayerState *)newState;

@end

NS_ASSUME_NONNULL_END
