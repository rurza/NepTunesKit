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
    var currentTrack: Track? { get }
    func nextTrack()
    func backTrack()
    func playPause()
}
