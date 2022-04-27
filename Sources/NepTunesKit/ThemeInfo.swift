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
    public let name: String

    /// The version of the theme
    ///
    /// The mechanism is very simple – increase the number if you want to use built-in mechanism for the updates
    public let version: UInt

    /// unique id of the theme
    ///
    /// reverse DNS notation is recommended, for example: com.software.NepTunes.DefaultTheme
    public let identifier: String

    /// the full name of the author, for example: Adam Różyński
    public let author: String

    /// file URL ti display the in the theme picker list
    ///
    /// it will be displayed in the rounded rectangle
    public let iconFileURL: URL

    public init(
        name: String,
        version: UInt,
        identifier: String,
        author: String,
        iconFileURL: URL
    ) {
        self.name = name
        self.version = version
        self.identifier = identifier
        self.author = author
        self.iconFileURL = iconFileURL
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
