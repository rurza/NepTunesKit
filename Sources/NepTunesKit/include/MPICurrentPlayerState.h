//
//  MPICurrentPlayerState.h
//  
//
//  Created by Adam on 14/03/2022.
//

#import <Foundation/Foundation.h>
#import "MPIPlayerPlaybackState.h"
#import "MPITrack.h"
#import "MPIPlayerType.h"
#import "MPIRepeatMode.h"

NS_ASSUME_NONNULL_BEGIN

@interface MPICurrentPlayerState : NSObject

@property (nonatomic) MPIRepeatMode             repeatMode;
@property (nonatomic) MPIPlayerType             playerType;
@property (nonatomic) MPIPlayerPlaybackState    playbackState;
@property (nonatomic) BOOL                      shuffle;
@property (nonatomic) NSUInteger                volume;
@property (nonatomic) id<MPITrack>              currentTrack;

@end

NS_ASSUME_NONNULL_END
