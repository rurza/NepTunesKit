//
//  MPIAnyTrack.h
//  
//
//  Created by Adam on 14/03/2022.
//

@import Foundation;
#import "MPITrack.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(AnyTrack)
@interface MPIAnyTrack : NSObject <MPITrack>

@property (nonatomic, readonly) NSString    *title;
@property (nonatomic, readonly) NSString    *album;
@property (nonatomic, readonly) NSString    *artist;
@property (nonatomic, readonly) NSString    *albumArtist;

@property (nonatomic, readonly) NSData      *artworkData;
@property (nonatomic, readonly) NSNumber    *duration;

- (instancetype)initWithTrack:(id<MPITrack> _Nonnull)track;

- (BOOL)isTheSameTrackAs:(id<MPITrack> _Nonnull)track;

@end

NS_ASSUME_NONNULL_END
