//
//  Track.swift
//  
//
//  Created by Adam Różyński on 03/08/2021.
//

import Foundation

/// Represents a track in the app and its metadata.
public protocol Track {
    var title: String { get }
    var artist: String { get }
    var album: String? { get }
    var albumArtist: String? { get }
    var artworkData: Data? { get }
    var isLoved: Bool? { get set }
    var duration: TimeInterval? { get }

    /// can contain additional metadata in the future,
    /// used as backing storage for compatibility
    var additionalInfo: Dictionary<String, AnyHashable> { get }

    func isTheSameTrackAs(_ track: Track?) -> Bool 
}

public extension Track {
    func eraseToAnyTrack() -> AnyTrack {
        AnyTrack(
            title: title,
            artist: artist,
            album: album,
            albumArtist: albumArtist,
            artworkData: artworkData,
            isLoved: isLoved,
            duration: duration,
            additionalInfo: additionalInfo
        )
    }

    func isTheSameTrackAs(_ track: Track?) -> Bool {
        self.artist == track?.artist && self.title == track?.title && self.album == track?.album
    }
}

public struct AnyTrack: Track, Equatable {
    public let title: String
    public let artist: String
    public let album: String?
    public let albumArtist: String?
    public var artworkData: Data?
    public var isLoved: Bool?
    public var duration: TimeInterval?
    public var additionalInfo: Dictionary<String, AnyHashable> = [:]

    public static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.title == rhs.title && lhs.artist == rhs.artist
        && lhs.album == rhs.album && lhs.albumArtist == rhs.albumArtist
        && lhs.artworkData == rhs.artworkData && lhs.duration == rhs.duration
    }
}

public extension AnyTrack {
    init(
        title: String,
        artist: String,
        album: String? = nil,
        albumArtist: String? = nil,
        artworkData: Data? = nil,
        duration: TimeInterval? = nil,
        additionalInfo: Dictionary<String, AnyHashable> = [:]
    ) {
        self.title = title
        self.artist = artist
        self.album = album
        self.albumArtist = albumArtist
        self.artworkData = artworkData
        self.duration = duration
        self.additionalInfo = additionalInfo
    }
}
