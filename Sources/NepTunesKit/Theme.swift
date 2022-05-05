//
//  Theme.swift
//
//
//  Created by Adam Różyński on 29/07/2021.
//

import Cocoa
import SwiftUI

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

    /// Please override this method
    open func themePreview() -> AnyView {
        AnyView(
            Text("Preview").foregroundColor(.white)
        )
    }

    /// Please override this method if your theme has preferences (please remember to set `hasPreferences` to true
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

    public var previewTrack: AnyTrack {
        AnyTrack(
            title: info.name,
            artist: info.author,
            album: nil,
            albumArtist: nil,
            artworkData: nil,
            isLoved: false,
            duration: nil
        )
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
