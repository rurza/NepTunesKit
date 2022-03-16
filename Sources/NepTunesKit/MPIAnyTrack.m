//
//  MPIAnyTrack.m
//  
//
//  Created by Adam on 14/03/2022.
//

#import "MPIAnyTrack.h"

@interface MPIAnyTrack ()
@property (nonatomic) NSString   *title;
@property (nonatomic) NSString   *album;
@property (nonatomic) NSString   *artist;
@property (nonatomic) NSString   *albumArtist;
@property (nonatomic) NSData     *artworkData;
@property (nonatomic) NSNumber   *duration;
@end

@implementation MPIAnyTrack

- (instancetype)initWithTrack:(id<MPITrack>)track {
    self = [super init];
    self.title = track.title;
    self.artist = track.artist;
    self.album = track.album;
    self.albumArtist = track.albumArtist;
    self.artworkData = track.artworkData;
    self.duration = track.duration;
    return self;
}

- (BOOL)isTheSameTrackAs:(id<MPITrack> _Nonnull)track {
    return [[track artist] isEqualToString:self.artist] &&
    [[track title] isEqualToString:self.title] &&
    [[track album] isEqualToString:self.album];
}


@end
