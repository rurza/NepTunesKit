//
//  MPIThemeWindow.m
//  
//
//  Created by Adam on 15/03/2022.
//

#import "MPIThemeWindow.h"

@interface MPIThemeWindow ()
@property (nonatomic) NSView *themeContent;
@property (nonatomic) NSString *themeIdentifier;
@end

@implementation MPIThemeWindow

- (instancetype)initWithIdentifier:(NSString * _Nonnull)identifier {
    self = [super initWithContentRect:NSMakeRect(0, 0, 0, 0)
                            styleMask:NSWindowStyleMaskBorderless
                              backing:NSBackingStoreBuffered
                                defer:YES];
    self.themeIdentifier = identifier;
    self.movableByWindowBackground = YES;
    self.movable = YES;
    self.acceptsMouseMovedEvents = YES;
    self.opaque = YES;
    self.titleVisibility = NSWindowTitleHidden;
    self.backgroundColor = [NSColor systemRedColor];
    self.canHide = YES;
    self.releasedWhenClosed = NO;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didMove:)
                                                 name:NSWindowDidMoveNotification
                                               object:self];
    NSString *stringFrame = [[NSUserDefaults standardUserDefaults] objectForKey:identifier];
    if (stringFrame) {
        [self setFrame:NSRectFromString(stringFrame) display:NO];
    } else {
        [self setFrame:NSMakeRect(60, 60, 100, 100) display:NO];
    }
    return self;
}


- (void)didMove:(NSNotification *)sender {
    if ([sender.object isKindOfClass:[NSWindow class]]) {
        NSWindow *window = sender.object;
        [[NSUserDefaults standardUserDefaults] setObject:NSStringFromRect(window.frame) forKey:self.themeIdentifier];
    }
}

#pragma mark: - setters/getters
- (__kindof NSView *)contentView {
    return self.themeContent.subviews.firstObject;
}

- (void)setContentView:(__kindof NSView *)contentView {
    for (NSView *subview in self.themeContent.subviews) {
        [subview removeFromSuperview];
    }
    if (contentView) {
        [self.themeContent addSubview:contentView];
        contentView.translatesAutoresizingMaskIntoConstraints = false;
        [contentView.leadingAnchor constraintEqualToAnchor:self.themeContent.leadingAnchor].active = YES;
        [contentView.topAnchor constraintEqualToAnchor:self.themeContent.topAnchor].active = YES;
        [contentView.trailingAnchor constraintEqualToAnchor:self.themeContent.trailingAnchor].active = YES;
        [contentView.bottomAnchor constraintEqualToAnchor:self.themeContent.bottomAnchor].active = YES;
    }
    [super setContentView:self.themeContent];
}

- (NSView *)themeContent {
    if (!_themeContent) {
        _themeContent = [[NSView alloc] init];
    }
    return _themeContent;
}

@end
