//
//  NepTunes.swift
//
//  Created by Adam Różyński on 29/08/2021.
//

import Foundation

public struct NepTunesPlayerState {
    public let playbackState: PlayerPlaybackState
    public let playerType: PlayerType
    public let currentTrack: Track?
    public let shuffle: Bool
    public let volume: Int
    public let repeatMode: RepeatMode

    public init(playbackState: PlayerPlaybackState, playerType: PlayerType, currentTrack: Track? = nil, shuffle: Bool, volume: Int, repeatMode: RepeatMode) {
        self.playbackState = playbackState
        self.playerType = playerType
        self.currentTrack = currentTrack
        self.shuffle = shuffle
        self.volume = volume
        self.repeatMode = repeatMode
    }
}

public protocol NepTunes {
    var playerState: NepTunesPlayerState? { get }
    func nextTrack()
    func backTrack()
    func playPause()
    func bringForward()
    func toggleLikeTrack()
    func toggleShuffleMode()
    func toggleRepeatMode()
    func setVolume(_ new: Int)
}

