//
//  Theme.swift
//
//
//  Created by Adam Różyński on 29/07/2021.
//

import Cocoa
import SwiftUI

public struct Track {

    public let title: String
    public let artist: String
    public let album: String?
    public let albumArtist: String?
    public let artworkData: Data?

    public init(title: String, artist: String, album: String?, albumArtist: String?, artworkData: Data?) {
        self.title = title
        self.artist = artist
        self.album = album
        self.albumArtist = albumArtist
        self.artworkData = artworkData
    }

}

public protocol NepTunes {
    var currentTrack: Track? { get }
    var volume: Double { get set }
    func nextTrack()
    func backTrack()
    func playPause()
}

public protocol Theme {

    var info: ThemeInfo { get }

    var app: NepTunes? { get }

//    var settings: [ThemeSettings] { get set }

//    static var defaultSettings: [ThemeSettings] { get }

    init()

    /// will be called by the app when it's set
    /// ideally you would init the window lazily, until it's actually needed
    func themeWindow() -> NSWindow

    func preferencesContentView() -> NSView

    func trackDidChange(_ track: Track)

}
