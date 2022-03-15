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

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(Theme)
@interface MPITheme : NSObject

@property (nonatomic) id<MPIWidgetApp> widget;

- (MPIThemeInfo *)info;
- (MPIThemeWindowBehavior)defaultThemeWindowBehavior;

@end

NS_ASSUME_NONNULL_END
