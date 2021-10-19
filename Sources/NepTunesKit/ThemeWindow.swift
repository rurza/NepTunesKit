//
//  ThemeWindow.swift
//
//  Created by Adam Różyński on 17/10/2021.
//

import Cocoa

open class ThemeWindow: NSWindow {

    private let windowIdentifier: String

    public init(identifier: String) {
        self.windowIdentifier = identifier
        super.init(contentRect: .zero, styleMask: [.borderless], backing: .buffered, defer: true)
        isMovableByWindowBackground = true
        isMovable = true
        acceptsMouseMovedEvents = true
        isOpaque = false
        titleVisibility = .hidden
        backgroundColor = .clear
        canHide = false
        isReleasedWhenClosed = false
        NotificationCenter.default.addObserver(self, selector: #selector(didMove(_:)), name: Self.didMoveNotification, object: self)
        if let frame = UserDefaults.standard.object(forKey: identifier) as? String {
            setFrame(NSRectFromString(frame), display: false)
        } else {
            setFrame(.init(x: 60, y: 60, width: 100, height: 100), display: false)
        }
    }

    @objc func didMove(_ sender: Notification) {
        let window = sender.object as! NSWindow
        UserDefaults.standard.set(NSStringFromRect(window.frame), forKey: windowIdentifier)
    }

}
