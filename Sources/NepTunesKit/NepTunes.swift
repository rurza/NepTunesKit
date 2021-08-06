//
//  NepTunes.swift
//  
//
//  Created by Adam Różyński on 03/08/2021.
//

import Foundation

public protocol NepTunes {
    var currentTrack: Track? { get }
    var volume: Double { get set }
    func nextTrack()
    func backTrack()
    func playPause()
}
