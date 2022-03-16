//
//  MPICurrentPlayerState.h
//  
//
//  Created by Adam on 14/03/2022.
//

@import Foundation;
#import "MPIPlayerPlaybackState.h"
#import "MPITrack.h"
#import "MPIPlayerType.h"
#import "MPIRepeatMode.h"

NS_ASSUME_NONNULL_BEGIN

@interface MPICurrentPlayerState : NSObject

@property (nonatomic, readonly) MPIRepeatMode             repeatMode;
@property (nonatomic, readonly) MPIPlayerType             playerType;
@property (nonatomic, readonly) MPIPlayerPlaybackState    playbackState;
@property (nonatomic, readonly) BOOL                      shuffle;
@property (nonatomic, readonly) NSUInteger                volume;
@property (nonatomic, readonly, nullable) id<MPITrack>    currentTrack;

- (instancetype)initWithRepeatMode:(MPIRepeatMode)repeatMode
                        playerType:(MPIPlayerType)playerType
                     playbackState:(MPIPlayerPlaybackState)playbackState
                           shuffle:(BOOL)shuffle
                            volume:(NSUInteger)volume
                      currentTrack:(id<MPITrack> _Nullable)currentTrack;

@end

NS_ASSUME_NONNULL_END
