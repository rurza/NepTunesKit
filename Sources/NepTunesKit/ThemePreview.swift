//
//  ThemePreview.swift
//  
//
//  Created by Adam Różyński on 03/08/2021.
//

import Cocoa
import SwiftUI

public struct ThemePreview {

    public let themePreview: (Track) -> AnyView

    public let previewBackgroundColor: (Track, @escaping (NSColor) -> Void) -> Void

    /// file URL ti display the in the theme picker list
    ///
    /// it will be displayed in the rounded rectangle
    public let iconImage: NSImage
    
    public init(themePreview: @escaping (Track) -> AnyView,
                previewBackgroundColor: @escaping (Track, @escaping (NSColor) -> Void) -> Void,
                iconImage: NSImage) {
        self.themePreview = themePreview
        self.previewBackgroundColor = previewBackgroundColor
        self.iconImage = iconImage
    }
    
}
