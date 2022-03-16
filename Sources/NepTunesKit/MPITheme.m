//
//  MPITheme.m
//  
//
//  Created by Adam on 15/03/2022.
//

#import "MPITheme.h"
#import "MPIThemeWindow.h"
#import "MPIThemeInfo.h"

@implementation MPITheme

- (MPIThemeInfo *)info {
    @throw [NSException exceptionWithName:@"Implement this method in your theme"
                                   reason:@""
                                 userInfo:nil];
}

- (void)stateDidChange:(MPICurrentPlayerState *)newState { }

- (MPIThemeWindowBehavior)defaultThemeWindowBehavior {
    return ThemeWindowBehaviorStuck;
}

- (MPIThemeWindow *)themeWindow {
    return [[MPIThemeWindow alloc] initWithIdentifier:[self info].identifier];
}

@end
