//
//  PlayerType.swift
//
//  Created by Adam Różyński on 28/08/2021.
//

import Foundation

/// Represents players that NepTunes supports
public enum PlayerType: String, CaseIterable, Equatable {
    case spotify = "com.spotify.client"

    /// Apple Music
    case musicApp = "com.apple.Music"
}
