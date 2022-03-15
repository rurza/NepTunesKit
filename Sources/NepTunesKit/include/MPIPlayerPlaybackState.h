//
//  MPIPlayerPlaybackState.h
//  
//
//  Created by Adam on 14/03/2022.
//

#ifndef MPIPlayerPlaybackState_h
#define MPIPlayerPlaybackState_h

typedef NS_ENUM(NSUInteger, MPIPlayerPlaybackState) {
    MPIPlayerPlaybackStateUnknown,
    MPIPlayerPlaybackStateStopped,
    MPIPlayerPlaybackStatePlaying,
    MPIPlayerPlaybackStatePaused,
} NS_SWIFT_NAME(PlayerPlaybackState);

#endif /* MPIPlayerPlaybackState_h */
