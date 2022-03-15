//
//  MPIPlayerType.h
//  
//
//  Created by Adam on 14/03/2022.
//

@import Foundation;

#ifndef MPIPlayerType_h
#define MPIPlayerType_h

typedef NS_ENUM(NSUInteger, MPIPlayerType) {
    MPIPlayerTypeSpotify,
    MPIPlayerTypeMusicApp
} NS_SWIFT_NAME(PlayerType);

MPIPlayerType playerTypeForIdentifier(NSString *identifier) {
    if ([identifier isEqualToString:@"com.spotify.client"]) {
        return MPIPlayerTypeSpotify;
    } else {
        return MPIPlayerTypeMusicApp;
    }
}

#endif /* MPIPlayerType_h */
