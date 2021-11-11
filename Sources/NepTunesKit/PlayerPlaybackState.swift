//
//  PlayerPlaybackState.swift
//  
//
//  Created by Adam Różyński on 29/07/2021.
//

import Foundation

public enum PlayerPlaybackState: Codable {
    case unknown
    case stopped
    case playing
    case paused
}
