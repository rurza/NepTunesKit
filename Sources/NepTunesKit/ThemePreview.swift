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

    public let previewBackgroundImage: (Track) async throws -> SwiftUI.Image

    public let preferencesView: () -> AnyView?

    /// file URL ti display the in the theme picker list
    ///
    /// it will be displayed in the rounded rectangle
    public let iconImage: NSImage
    
    public init(themePreview: @escaping (Track) -> AnyView,
                previewBackgroundImage: @escaping (Track) async throws -> SwiftUI.Image,
                preferencesView: @autoclosure @escaping () -> AnyView?,
                iconImage: NSImage) {
        self.themePreview = themePreview
        self.previewBackgroundImage = previewBackgroundImage
        self.preferencesView = preferencesView
        self.iconImage = iconImage
    }
    
}
