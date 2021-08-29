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
    var url: URL? { get }
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
                 url: url,
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
    public var url: URL?
    public var duration: TimeInterval?
}

public extension AnyTrack {
    init(title: String, artist: String, album: String, albumArtist: String?, artworkData: Data?, duration: TimeInterval?) {
        self.title = title
        self.artist = artist
        self.album = album
        self.albumArtist = albumArtist
        self.artworkData = artworkData
        self.duration = duration
    }
}
