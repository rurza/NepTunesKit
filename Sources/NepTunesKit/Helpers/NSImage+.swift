//
//  NSImage+.swift
//  
//
//  Created by Adam Różyński on 27/10/2021.
//

import Cocoa

public extension NSImage {
    convenience init(color: NSColor) {
        self.init(size: .init(width: 1, height: 1))
        self.lockFocus()
        color.drawSwatch(in: NSMakeRect(0, 0, size.width, size.height))
        self.unlockFocus()
    }
}
