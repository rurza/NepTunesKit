//
//  MPIThemePreview.h
//  
//
//  Created by Adam on 17/03/2022.
//

@import Cocoa;
#import "MPITrack.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(ThemePreview)
@interface MPIThemePreview : NSObject

- (NSView *)themePreviewForTrack:(id<MPITrack>)track;
- (NSView *)preferencesView;
- (NSImage *)previewBackgroundImage:(id<MPITrack>)track;
- (NSImage *)iconImage;

@end

NS_ASSUME_NONNULL_END
