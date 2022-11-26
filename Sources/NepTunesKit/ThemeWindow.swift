//
//  ThemeWindow.swift
//
//  Created by Adam Różyński on 17/10/2021.
//

import Cocoa

/// Window used to display the widget with the theme on the desktop
///
/// ``ThemeWindow`` provides 3 functionality required for the widget:
/// - displays the transparent, draggable window that's perfect for displaying artwork on user's screen,
/// - manaes window position for each theme, by providing the default value and by persisting the last position, so the app can display the widget for a theme in the exact place the user left it
/// - provides the infrastructure for the app to display a context menu when the user clicks on widget with secondary click
///
open class ThemeWindow: NSWindow {

    private let windowIdentifier: String
    public static let rightMouseDown = NSNotification.Name(rawValue: "com.micropixels.NepTunesKit.rightMouseDown")

    /// initialize and sets up the window
    /// - Parameter identifier: identifier used to persist the position
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
        isExcludedFromWindowsMenu = true
        NotificationCenter.default.addObserver(self, selector: #selector(didMove(_:)), name: Self.didMoveNotification, object: self)
        if let frame = UserDefaults.standard.object(forKey: identifier) as? String {
            setFrame(NSRectFromString(frame), display: false)
        } else {
            setFrame(Self.defaultFrame, display: false)
        }
    }

    // set it as unavailable
    public init() {
        fatalError()
    }

    @objc func didMove(_ sender: Notification) {
        let window = sender.object as! NSWindow
        UserDefaults.standard.set(NSStringFromRect(window.frame), forKey: windowIdentifier)
    }

    private lazy var _contentView = ContentView()

    public override var contentView: NSView? {
        set {
            _contentView.subviews.forEach { $0.removeFromSuperview() }
            if let contentView = newValue {
                _contentView.addSubview(contentView)
                contentView.translatesAutoresizingMaskIntoConstraints = false
                contentView.leadingAnchor.constraint(equalTo: _contentView.leadingAnchor).isActive = true
                contentView.topAnchor.constraint(equalTo: _contentView.topAnchor).isActive = true
                contentView.trailingAnchor.constraint(equalTo: _contentView.trailingAnchor).isActive = true
                contentView.bottomAnchor.constraint(equalTo: _contentView.bottomAnchor).isActive = true
            }
            super.contentView = _contentView
        }
        get {
            _contentView.subviews.first
        }
    }

    /// default position to place the widget on screen
    /// when there is no position stored on disk
    open class var defaultFrame: NSRect {
        .init(x: 60, y: 60, width: 100, height: 100)
    }

    open override func cascadeTopLeft(from topLeftPoint: NSPoint) -> NSPoint {
        .zero
    }
}

private class ContentView: NSView {
    override func rightMouseDown(with event: NSEvent) {
        super.rightMouseDown(with: event)
        NotificationCenter.default.post(
            name: ThemeWindow.rightMouseDown,
            object: self.window
        )
    }
}
