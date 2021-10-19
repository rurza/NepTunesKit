//
//  Theme.swift
//
//
//  Created by Adam Różyński on 29/07/2021.
//

import Cocoa
import SwiftUI

open class Theme {
    public var nepTunesController: NepTunesController?

    public required init() { }

    /// override, otherwise it'll crash the app
    open func info() -> ThemeInfo {
        fatalError()
    }

    /// override, otherwise it'll crash the app
    open func preview() -> ThemePreview {
        fatalError()
    }

    open func themeWindow() -> ThemeWindow {
        let window = ThemeWindow(identifier: info().identifier)
        return window
    }

    open func defaultThemeWindowBehavior() -> ThemeWindowBehavior {
        return .stuck
    }

    open func stateDidChange(_ state: NepTunesPlayerState?) { }

}
