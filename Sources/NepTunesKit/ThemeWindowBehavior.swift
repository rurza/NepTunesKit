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
///
public enum ThemeWindowBehavior: Int, CaseIterable, Identifiable, RawRepresentable, Codable {
    case stuck
    case above
    case normal

    public var id: Self {
        self
    }
}
