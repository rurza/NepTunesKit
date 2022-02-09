//
//  Track.swift
//  
//
//  Created by Adam Różyński on 03/08/2021.
//

import Foundation

public protocol Track {
    var title: String { get }
    var artist: String { get }
    var album: String? { get }
    var albumArtist: String? { get }
    var artworkData: Data? { get }
    var isLiked: Bool? { get set }
    var duration: TimeInterval? { get }

    func isTheSameTrackAs(_ track: Track?) -> Bool 
}

public extension Track {
    func eraseToAnyTrack() -> AnyTrack {
        AnyTrack(title: title,
                 artist: artist,
                 album: album,
                 albumArtist: albumArtist,
                 artworkData: artworkData,
                 isLiked: isLiked,
                 duration: duration)
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
    public var isLiked: Bool?
    public var duration: TimeInterval?

    public static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.title == rhs.title && lhs.artist == rhs.artist
        && lhs.album == rhs.album && lhs.albumArtist == rhs.albumArtist
        && lhs.artworkData == rhs.artworkData && lhs.duration == rhs.duration
    }
}

public extension AnyTrack {
    init(title: String, artist: String, album: String?, albumArtist: String?, artworkData: Data?, duration: TimeInterval?) {
        self.title = title
        self.artist = artist
        self.album = album
        self.albumArtist = albumArtist
        self.artworkData = artworkData
        self.duration = duration
    }
}
