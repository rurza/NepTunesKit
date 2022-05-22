//
//  PlayerPlaybackState.swift
//  
//
//  Created by Adam Różyński on 29/07/2021.
//

import Foundation

/// Represents tha playback state of the current player
public enum PlayerPlaybackState: Codable {
    /// default value, used when the app wasn't able to determine
    /// player's state or there is no current player at the moment
    case unknown

    /// player is running but it's stopped
    case stopped

    /// player is running and it's currently playing the music;
    /// there should be a ``NepTunesPlayerState/currentTrack`` available
    case playing

    /// player is paused – there should be a ``NepTunesPlayerState/currentTrack`` available
    case paused
}
