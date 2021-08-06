//
//  ThemeInfo.swift
//  
//
//  Created by Adam Różyński on 30/07/2021.
//

import Foundation

public struct ThemeInfo: Hashable {

    /// The name of the theme
    ///
    /// This will be displayed in the NepTunes' preferences
    public var name: String

    /// The version of the theme
    ///
    /// The mechanism is very simple – increase the number if you want to use built-in mechanism for the updates
    public var version: UInt

    /// unique id of the theme
    ///
    /// reverse DNS notation is recommended, for example: com.software.NepTunes.DefaultTheme
    public var identifier: String

    /// the full name of the author, for example: Adam Różyński
    public var author: String

    public init(name: String,
                version: UInt,
                identifier: String,
                author: String) {
        self.name = name
        self.version = version
        self.identifier = identifier
        self.author = author
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}

extension ThemeInfo: Identifiable {
    public var id: String {
        identifier
    }
}
