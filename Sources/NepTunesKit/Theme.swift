//
//  Theme.swift
//
//
//  Created by Adam Różyński on 29/07/2021.
//

import Cocoa
import SwiftUI

public protocol Theme {

    var info: ThemeInfo { get }

    var preview: ThemePreview { get }

    var app: NepTunes? { get }

    init()

    /// will be called by the app when it's set
    /// ideally you would init the window lazily, until it's actually needed
    /// it should contain the working theme
    func themeWindow() -> NSWindow

    func preferencesView() -> AnyView

    func trackDidChange(_ track: Track?)

}
