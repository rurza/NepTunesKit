//
//  NSImage+NSColor.m
//  
//
//  Created by Adam on 14/03/2022.
//

#import "NSImage+NSColor.h"

@implementation NSImage (NSColor)

- (instancetype)initWithColor:(NSColor *)color {
    self = [self initWithSize:NSMakeSize(1, 1)];
    [self lockFocus];
    [color drawSwatchInRect:NSMakeRect(0, 0, self.size.width, self.size.height)];
    [self unlockFocus];
}

@end
