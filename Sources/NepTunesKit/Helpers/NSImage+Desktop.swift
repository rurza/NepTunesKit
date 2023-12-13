//
//  NSImage+Desktop.swift
//  
//
//  Created by Adam Różyński on 27/10/2021.
//

import Cocoa

// ref: https://stackoverflow.com/questions/51879210/how-to-set-desktop-image-to-nswindow-programmatically-objective-c?noredirect=1&lq=1
public extension NSImage {
    static func desktopPictures() -> [NSImage] {
        guard let info = CGWindowListCopyWindowInfo(.optionOnScreenOnly, kCGNullWindowID) as? [[ String : Any]] else { return [] }
        let scale = NSScreen.main?.backingScaleFactor ?? 1
        var images = [NSImage]()
        for window in info {
            // we need windows owned by Dock
            guard let owner = window["kCGWindowOwnerName"] as? String else { continue }
            if owner != "Dock" {
                continue
            }
            // we need windows named like "Desktop Picture %"
            guard let name = window["kCGWindowName"] as? String else { continue }
            if !name.hasPrefix("Desktop Picture") && !name.hasPrefix("Wallpaper") {
                continue
            }
            // this belongs to a screen
            guard let index = window["kCGWindowNumber"] as? CGWindowID else { continue }
            if let cgImage = CGWindowListCreateImage(CGRect.infinite, CGWindowListOption(arrayLiteral: CGWindowListOption.optionIncludingWindow), index, CGWindowImageOption.bestResolution) {
                let width = CGFloat(cgImage.width) / scale
                let height = CGFloat(cgImage.height) / scale
                let size = NSMakeSize(width, height)
                let nsImage = NSImage(cgImage: cgImage, size: size)
                images.append(nsImage)
            }
        }
        // return the array of Desktop images
        return images
    }
}
