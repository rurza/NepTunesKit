//
//  Theme.swift
//
//
//  Created by Adam Różyński on 29/07/2021.
//

import Cocoa
import SwiftUI

open class Theme: Equatable {
    public var nepTunesController: NepTunesController?

    public required init() { }

    /// override without calling super, otherwise it'll crash the app
    open func info() -> ThemeInfo {
//        assert(false, "Please override method `info` without calling super")
        return ThemeInfo(name: "Theme", version: UInt.max, identifier: "com.example.NepTunesTheme", author: "Homer")
    }

    /// override without calling super, otherwise it'll crash the app
    open func preview() -> ThemePreview {
//        assert(false, "Please override method `preview` without calling super")
        return ThemePreview(
            themePreview: {
                AnyView(Text($0.title))
            },
            previewBackgroundImage: { track in
                NSImage(color: .black)
            },
            preferencesView: nil,
            iconImage: NSImage(color: .systemCyan)
        )
    }

    open func themeWindow() -> ThemeWindow {
        let window = ThemeWindow(identifier: info().identifier)
        return window
    }

    open func defaultThemeWindowBehavior() -> ThemeWindowBehavior {
        return .stuck
    }

    open func stateDidChange(_ state: NepTunesPlayerState?) { }

    public static func ==(lhs: Theme, rhs: Theme) -> Bool {
        lhs.info().identifier == rhs.info().identifier && lhs.info().name == rhs.info().name
    }
    
}
