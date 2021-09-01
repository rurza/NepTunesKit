//
//  Player.swift
//  
//
//  Created by Adam Różyński on 03/08/2021.
//

import Foundation

public protocol Player {
    var volume: Int { get set }
    var playbackState: PlayerPlaybackState { get }
    var playerType: PlayerType { get }
    var currentTrack: Track? { get }
    var shuffle: Bool { get }
    var repeatMode: RepeatMode { get }
    func nextTrack()
    func backTrack()
    func playPause()
    func toggleShuffle() -> Bool
    func toggleRepeatMode() -> RepeatMode
    // Optional
    func toggleLikeTrack() -> Bool
}
