//
//  NepTunes.swift
//
//  Created by Adam Różyński on 29/08/2021.
//

import Foundation

public protocol NepTunes {
    var volume: Int { get }
    var playbackState: PlayerPlaybackState { get }
    var playerType: PlayerType { get }
    var currentTrack: Track? { get }
    var shuffle: Bool { get }
    var repeatMode: RepeatMode { get }
    func nextTrack()
    func backTrack()
    func playPause()
    func bringForward()
    func toggleLikeTrack()
    func toggleShuffleMode()
    func toggleRepeatMode()
    func setVolume(_ new: Int)
}

