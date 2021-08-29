//
//  Player.swift
//  
//
//  Created by Adam Różyński on 03/08/2021.
//

import SwiftUI

public protocol Player {
    var volume: Int { get set }
    var playbackStatus: PlayerPlaybackState { get }
    var playerType: PlayerType { get }
    var currentTrack: Track? { get }
    var shuffle: Bool { get set }
    var repeatMode: RepeatMode { get set }
    func nextTrack()
    func backTrack()
    func playPause()
    func bringForward()
    func toggleLikeTrack()
}

public enum RepeatMode {
    case all
    case one
    case off
}
