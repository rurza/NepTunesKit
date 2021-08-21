//
//  NepTunes.swift
//  
//
//  Created by Adam Różyński on 03/08/2021.
//

import SwiftUI

public protocol NepTunes {
    var volume: Double { get set }
    func nextTrack()
    func backTrack()
    func playPause()
}
