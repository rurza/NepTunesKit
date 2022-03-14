//
//  NSImage+Desktop.m
//  
//
//  Created by Adam on 14/03/2022.
//

#import "NSImage+Desktop.h"

@implementation NSImage (Desktop)

+ (NSArray<NSImage *> *)desktopPictures {
    CFArrayRef infoRef = CGWindowListCopyWindowInfo(kCGWindowListOptionOnScreenOnly, kCGNullWindowID);
    NSArray *info = (__bridge NSArray *)infoRef;
    if (info == nil) {
        return nil;
    }
    CGFloat scale = NSScreen.mainScreen.backingScaleFactor;
    NSMutableArray *images = [NSMutableArray new];
    for (NSDictionary *windowInfo in info) {
        NSString *owner = [windowInfo objectForKey:(__bridge NSString *)kCGWindowOwnerName];
        if (owner == nil || ![owner isEqualToString:@"Dock"]) {
            continue;
        }
        NSString *name = [windowInfo objectForKey:(__bridge NSString *)kCGWindowName];
        if (![name hasPrefix:@"Desktop Picture"]) {
            continue;
        }
        CGWindowID index = [windowInfo objectForKey:(__bridge NSString *)kCGWindowNumber];
        if (index == 0) { continue; }
        CGImageRef cgImage = CGWindowListCreateImage(CGRectInfinite, kCGWindowListOptionIncludingWindow, index, kCGWindowImageBestResolution);
        if (cgImage == NULL) { continue; }
        CGFloat width = (CGFloat)CGImageGetWidth(cgImage) / scale;
        CGFloat height = (CGFloat)CGImageGetHeight(cgImage) / scale;
        NSSize size = NSMakeSize(width, height);
        NSImage *image = [[NSImage alloc] initWithCGImage:cgImage size:size];
        [images addObject:image];
    }
    return images;
}

@end
