//
//  Theme.swift
//
//
//  Created by Adam Różyński on 29/07/2021.
//

import Cocoa
import SwiftUI

open class Theme<App: NepTunes>: Equatable {
    public var app: App?
    public let url: URL

    open var hasPreferences = false
    
    public required init(url: URL) {
        self.url = url
    }
    /// override without calling super, otherwise it'll crash the app
    /// - Returns: info that will be used to display info about plugin
    open func info() -> ThemeInfo {
        assertionFailure("Please override method `info` without calling super")
        return ThemeInfo(
            name: "Theme",
            version: UInt.max,
            identifier: "com.example.NepTunesTheme",
            author: "Homer",
            iconFileURL: URL(fileURLWithPath: "/")
        )
    }

    /// Please override this method
    open func themePreview(for track: Track) -> some View {
        Text(track.title).foregroundColor(.white)
    }

    /// Please override this method if your theme has preferences (please remember to set `hasPreferences` to true
    open func preferencesView() -> some View {
        EmptyView()
    }

    open func previewBackgroundImage(for track: Track) async throws -> NSImage {
        NSImage(color: .black)
    }

    open func themeWindow() -> ThemeWindow {
        let window = ThemeWindow(identifier: info().identifier)
        return window
    }

    open func defaultThemeWindowBehavior() -> ThemeWindowBehavior {
        return .stuck
    }

    public static func ==(lhs: Theme, rhs: Theme) -> Bool {
        lhs.info().identifier == rhs.info().identifier && lhs.info().name == rhs.info().name
    }
    
}
