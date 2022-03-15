//
//  MPITrack.h.h
//  
//
//  Created by Adam on 14/03/2022.
//

#ifndef MPITrack_h
#define MPITrack_h
@import Foundation;

NS_SWIFT_NAME(Track)
@protocol MPITrack <NSObject>

- (NSString * _Nonnull)title;
- (NSString * _Nonnull)artist;
- (NSString * _Nullable)album;
- (NSString * _Nullable)albumArtist;
- (NSData * _Nullable)artworkData;
- (NSNumber * _Nullable)duration;

- (BOOL)isTheSameTrackAs:(id<MPITrack> _Nonnull)track;
@end

#endif /* MPITrack_h */
