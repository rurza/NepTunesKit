//
//  Track.swift
//  
//
//  Created by Adam Różyński on 03/08/2021.
//

import Foundation

public struct Track: Equatable {

    public let title: String
    public let artist: String
    public let album: String?
    public let albumArtist: String?
    public let artworkData: Data?
    public let isLiked: Bool?
    public let url: URL?

    public init(title: String, artist: String, album: String?,
                albumArtist: String?, artworkData: Data?,
                isLiked: Bool?, url: URL?) {
        self.title = title
        self.artist = artist
        self.album = album
        self.albumArtist = albumArtist
        self.artworkData = artworkData
        self.isLiked = isLiked
        self.url = url
    }

}
