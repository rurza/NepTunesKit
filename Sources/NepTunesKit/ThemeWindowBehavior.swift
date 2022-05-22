//
//  ThemeWindowBehavior.swift
//  
//
//  Created by Adam Różyński on 30/07/2021.
//

import Foundation
import SwiftUI

/// Represents the behavior of the window that will display the widget
///
public enum ThemeWindowBehavior: Int, CaseIterable, Identifiable, RawRepresentable, Codable {
    /// "stuck" the window to the desktop, kind of like an icon.
    /// It'll be placed below all other windows and won't be visible in Mission Control
    case stuck

    /// the window will float above all other windows; it won't be visible in Mission Control
    case above

    /// the window will behave like any standard window in macOS
    case normal

    public var id: Self {
        self
    }
}
