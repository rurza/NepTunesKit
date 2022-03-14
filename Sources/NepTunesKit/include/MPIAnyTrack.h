//
//  MPIAnyTrack.h
//  
//
//  Created by Adam on 14/03/2022.
//

#import <Foundation/Foundation.h>
#import "MPITrack.h"

NS_ASSUME_NONNULL_BEGIN

@interface MPIAnyTrack : NSObject <MPITrack>

@property (nonatomic, readonly) NSString *title;

@end

NS_ASSUME_NONNULL_END
