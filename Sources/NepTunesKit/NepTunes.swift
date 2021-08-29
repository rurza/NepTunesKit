//
//  NepTunes.swift
//
//  Created by Adam Różyński on 29/08/2021.
//

import Foundation

public protocol NepTunes {
    var volume: Int { get set }
    var playbackState: PlayerPlaybackState { get }
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

