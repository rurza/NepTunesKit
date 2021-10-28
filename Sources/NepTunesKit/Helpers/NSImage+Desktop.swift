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
        let info = CGWindowListCopyWindowInfo(.optionOnScreenOnly, kCGNullWindowID) as? [[ String : Any]]
        var images = [NSImage]()
        for window in info! {
            // we need windows owned by Dock
            let owner = window["kCGWindowOwnerName"] as! String
            if owner != "Dock" {
                continue
            }
            // we need windows named like "Desktop Picture %"
            let name = window["kCGWindowName"] as! String
            if !name.hasPrefix("Desktop Picture") {
                continue
            }
            // this belongs to a screen
            let index = window["kCGWindowNumber"] as! CGWindowID
            let cgImage = CGWindowListCreateImage(CGRect.infinite, CGWindowListOption(arrayLiteral: CGWindowListOption.optionIncludingWindow), index, CGWindowImageOption.nominalResolution)
            images.append(NSImage(cgImage: cgImage!, size: NSMakeSize(CGFloat(cgImage!.width), CGFloat(cgImage!.height))))
        }
        // return the array of Desktop images
        return images
    }
}
