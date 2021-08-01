//
//  ThemeInfo.swift
//  
//
//  Created by Adam Różyński on 30/07/2021.
//

import Foundation

public struct ThemeInfo {

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
    public var id: String

    /// file URL to display the image in the theme picker
    public var screenshotFileURL: URL

    public init(name: String, version: UInt, id: String, screenshotFileURL: URL) {
        self.name = name
        self.version = version
        self.id = id
        self.screenshotFileURL = screenshotFileURL
    }
}
