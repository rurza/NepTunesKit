//
//  IPC.h
//  
//
//  Created by Adam on 14/03/2022.
//
@import Foundation;
#import "MPIPlayerPlaybackState.h"

NSString *const kMPIWidgetIdentifier = @"YL78V8PY6H.pl.micropixels.NepTunes.Widget";


@protocol MPIWidgetService <NSObject>

- (void)trackArtworkDidChange:(NSImage *)image;
- (void)playerStateDidChange:(MPIPlayerPlaybackState *)state;

@end


@protocol MPIWidgetApp <NSObject>

- (void)nextTrack;
- (void)backTrack;
- (void)playPause;
- (void)bringForward;
- (void)toggleLikeTrack;
- (void)toggleShuffleMode;
- (void)toggleRepeatMode;
- (void)setVolume:(NSUInteger)volume;

@end
