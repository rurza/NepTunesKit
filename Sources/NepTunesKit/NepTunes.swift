//
//  NepTunes.swift
//
//  Created by Adam Różyński on 29/08/2021.
//

import Foundation
import AppKit

open class NepTunes: ObservableObject {
    @Published public var state: NepTunesPlayerState?

    public init() { }

    open func nextTrack() { }
    open func backTrack() { }
    open func playPause() { }
    open func bringForward() { }
    open func toggleLikeTrack() { }
    open func toggleShuffleMode() { }
    open func toggleRepeatMode() { }
    open func setVolume(_ new: Int) { }
}

public struct NepTunesPlayerState {
    public let playbackState: PlayerPlaybackState
    public let playerType: PlayerType
    public let currentTrack: Track?
    public let shuffle: Bool
    public let volume: Int
    public let repeatMode: RepeatMode

    public init(
        playbackState: PlayerPlaybackState,
        playerType: PlayerType,
        currentTrack: Track? = nil,
        shuffle: Bool,
        volume: Int,
        repeatMode: RepeatMode
    ) {
        self.playbackState = playbackState
        self.playerType = playerType
        self.currentTrack = currentTrack
        self.shuffle = shuffle
        self.volume = volume
        self.repeatMode = repeatMode
    }
}