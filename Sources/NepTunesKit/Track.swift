//
//  Track.swift
//  
//
//  Created by Adam Różyński on 03/08/2021.
//

import Foundation

/// Represents a track in the app and its metadata.
public struct Track: Equatable {
    public let title: String
    public let artist: String
    public let album: String?
    public let albumArtist: String?
    public let artworkData: Data?
    public let isLoved: Bool?
    public let duration: TimeInterval?

    /// can contain additional metadata in the future,
    /// used as backing storage for compatibility
    public let additionalInfo: Dictionary<String, AnyHashable>?
    
    public init(
        title: String,
        artist: String,
        album: String? = nil,
        albumArtist: String? = nil,
        artworkData: Data? = nil,
        isLoved: Bool? = nil,
        duration: TimeInterval? = nil,
        additionalInfo: Dictionary<String, AnyHashable>? = nil
    ) {
        self.title = title
        self.artist = artist
        self.album = album
        self.albumArtist = albumArtist
        self.artworkData = artworkData
        self.isLoved = isLoved
        self.duration = duration
        self.additionalInfo = additionalInfo
    }
}
