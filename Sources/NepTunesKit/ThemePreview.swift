//
//  ThemePreview.swift
//  
//
//  Created by Adam Różyński on 03/08/2021.
//

import Cocoa
import SwiftUI

public typealias PreviewBackgroundHandler = (Track) async throws -> SwiftUI.Color

public struct ThemePreview {

    public let themePreview: (Track) -> AnyView

    public let previewBackgroundColor: (Track) async throws -> SwiftUI.Color

    public let preferencesView: () -> AnyView?

    /// file URL ti display the in the theme picker list
    ///
    /// it will be displayed in the rounded rectangle
    public let iconImage: NSImage
    
    public init(themePreview: @escaping (Track) -> AnyView,
                previewBackgroundColor: @escaping (Track) async throws -> SwiftUI.Color,
                preferencesView: @autoclosure @escaping () -> AnyView?,
                iconImage: NSImage) {
        self.themePreview = themePreview
        self.previewBackgroundColor = previewBackgroundColor
        self.preferencesView = preferencesView
        self.iconImage = iconImage
    }
    
}
