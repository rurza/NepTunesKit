//
//  MPICurrentPlayerState.m
//  
//
//  Created by Adam on 14/03/2022.
//

#import "MPICurrentPlayerState.h"

@interface MPICurrentPlayerState ()
@property (nonatomic) MPIRepeatMode             repeatMode;
@property (nonatomic) MPIPlayerType             playerType;
@property (nonatomic) MPIPlayerPlaybackState    playbackState;
@property (nonatomic) BOOL                      shuffle;
@property (nonatomic) NSUInteger                volume;
@property (nonatomic, nullable) id<MPITrack>    currentTrack;
@end

@implementation MPICurrentPlayerState

- (instancetype)initWithRepeatMode:(MPIRepeatMode)repeatMode
                        playerType:(MPIPlayerType)playerType
                     playbackState:(MPIPlayerPlaybackState)playbackState
                           shuffle:(BOOL)shuffle
                            volume:(NSUInteger)volume
                      currentTrack:(id<MPITrack> _Nullable)currentTrack {
    self = [super init];
    self.repeatMode = repeatMode;
    self.playerType = playerType;
    self.playbackState = playbackState;
    self.shuffle = shuffle;
    self.volume = volume;
    self.currentTrack = currentTrack;
    return self;
}

@end
