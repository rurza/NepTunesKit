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

    var player: Player? { get set }

    init()

    /// will be called by the app when the theme is set
    /// ideally you would init the window lazily, until it's actually needed
    /// it should contain the working theme
    ///
    /// window will be hold strongly by the app and the app will manage the its visibility – if there
    /// is no track then window will be hidden
    /// but it's the theme role to manage the UI state when the track changes
    func themeWindow() -> NSWindow

}
