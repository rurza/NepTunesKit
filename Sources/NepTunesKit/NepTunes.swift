//
//  NepTunes.swift
//
//  Created by Adam Różyński on 29/08/2021.
//

import Foundation
import AppKit
import SwiftUI

/// Represents the app and its state to the theme.
open class NepTunes: ObservableObject {
    @Published public var state: NepTunesPlayerState?

    public init() { }

    /// Play the next track in the queue
    open func nextTrack() { }

    /// Will start the playback of the current track from the beginning;
    /// if the track just started playing (~5 seconds) it'll play the previous track if possible
    open func backTrack() { }

    /// Toggle playback;
    /// observe the ``NepTunes/state/`` and its ``NepTunesPlayerState/playbackState`` to know,
    /// in which mode the current player is
    open func playPause() { }

    /// Will bring the current player's window up front, even if it's closed,
    /// minimized or the app is hidden
    open func bringForward() { }

    /// Will toggle the like/love status of the current track (works on in Apple Music)
    open func toggleLikeTrack() { }

    /// Will toggle the shuffle mode (on/off)
    open func toggleShuffleMode() { }

    /// Will toggle the repeat mode.
    ///
    /// Check out the ``RepeatMode`` for possible options
    open func toggleRepeatMode() { }

    /// Sets the volume of the player (not the system), range: 0...100
    open func setVolume(_ new: Int) { }

    public static var defaultArtwork: Image {
        Image("nocover")
    }
}

// sourcery: AutoEquatable
/// Represents player state.
/// NepTunes always manages one player at the time and this player is known as the "current player"
public struct NepTunesPlayerState: Equatable {
    public let playbackState: PlayerPlaybackState
    public let playerType: PlayerType

    /// The current track (can be paused).
    /// It's nil if the player is running but the playback was stopped or the player just launched.
    public let currentTrack: Track?
    public let shuffle: Bool

    /// the scale is from 0 to 100
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
