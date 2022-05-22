//
//  RepeatMode.swift
//
//  Created by Adam Różyński on 29/08/2021.
//

import Foundation

public enum RepeatMode: Codable {
    /// the current queue (album, playlist) will play from the start
    case all

    /// the current track will be played in loop
    case one

    /// the player will stop the playback when the queue is empty
    case off
}
