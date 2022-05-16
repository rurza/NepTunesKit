//
//  Theme.swift
//
//
//  Created by Adam Różyński on 29/07/2021.
//

import Cocoa
import SwiftUI

/// The base abstract class that represents the theme to the app
///
/// Subclass this class and override
open class Theme: Equatable, Identifiable, Hashable {
    public let app: NepTunes
    public let url: URL
    
    /// info that will be used to display info about plugin
    /// override it
    open var info: ThemeInfo {
        assertionFailure()
        return ThemeInfo(
            name: "Theme",
            version: UInt.max,
            identifier: "com.example.NepTunes.Theme",
            author: "Homer",
            iconFileURL: URL(fileURLWithPath: "/")
        )
    }

    public required init(url: URL, app: NepTunes) {
        self.url = url
        self.app = app
    }

    /// A view that will be displayed in NepTunes' preferences
    ///
    /// Override this method.
    /// This view will be stacked on the background returned by `previewBackgroundView()`.
    /// It's recommended to return your theme in it, but keep in mind that the preview can be used even if there is no player running so please provide a default track info that will be displayed in this case. `Theme` class provides an overridable static variable `previewTrack` with title and artist
    /// - Returns: a view wrapped in AnyView
    open func themePreview() -> AnyView {
        assertionFailure()
        return AnyView(
            Text("Preview").foregroundColor(.white)
        )
    }

    /// A view that will display preferences for this theme
    ///
    /// Please override this method if your theme has preferences
    open func preferencesView() -> AnyView? {
        return nil
    }

    open func previewBackgroundView() -> AnyView {
        AnyView(
            Color.black
        )
    }

    open func themeWindow() -> ThemeWindow {
        let window = ThemeWindow(identifier: info.identifier)
        return window
    }

    open func defaultThemeWindowBehavior() -> ThemeWindowBehavior {
        return .stuck
    }

    public static func ==(lhs: Theme, rhs: Theme) -> Bool {
        lhs.info.identifier == rhs.info.identifier && lhs.info.name == rhs.info.name
    }

    public var id: String { info.identifier }

    open class var previewTrack: AnyTrack {
        AnyTrack(
            title: "Title",
            artist: "Artist",
            album: "Album"
        )
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
