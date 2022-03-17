//
//  MPIThemePreview.m
//  
//
//  Created by Adam on 17/03/2022.
//

#import "MPIThemePreview.h"

@implementation MPIThemePreview

- (NSView *)themePreviewForTrack:(id<MPITrack>)track {
    @throw [NSException exceptionWithName:@"Implement this method in your theme preview"
                                   reason:@""
                                 userInfo:nil];
}

- (NSImage *)previewBackgroundImage:(id<MPITrack>)track {
    @throw [NSException exceptionWithName:@"Implement this method in your theme preview"
                                   reason:@""
                                 userInfo:nil];
}

- (NSView *)preferencesView {
    @throw [NSException exceptionWithName:@"Implement this method in your theme preview"
                                   reason:@""
                                 userInfo:nil];
}

- (NSImage *)iconImage {
    @throw [NSException exceptionWithName:@"Implement this method in your theme preview"
                                   reason:@""
                                 userInfo:nil];
}

@end
