//
//  Theme.swift
//
//
//  Created by Adam Różyński on 29/07/2021.
//

import Cocoa
import SwiftUI

/// The base abstract class that represents the theme to the app
///
/// ## Overview
/// ``Theme`` is the essential data structure for your Theme.
/// Its subclass is what you'll have to provide as the *NSPrincipalClass*
/// in your bundle's Info.plist and it's the object that will be
/// initialized by the NepTunes app.
///
/// To define a theme, subclass this class and at least override:
/// - ``Theme/info``
/// - ``Theme/themeWindow()``
/// - ``Theme/themePreview()``
///
/// By overriding these symbols you'll have a theme with no custom preferences UI
/// and black background in the preview.
open class Theme: Equatable, Identifiable, Hashable {
    public let app: NepTunes
    public let url: URL
    
    /// Info that will be used to display info about your Theme. Override it.
    open var info: ThemeInfo {
        assertionFailure()
        return ThemeInfo(
            name: "Theme",
            version: UInt.max,
            identifier: "com.example.NepTunes.Theme",
            author: "Homer",
            iconFileURL: URL(fileURLWithPath: "/")
        )
    }

    public required init(url: URL, app: NepTunes) {
        self.url = url
        self.app = app
    }

    /// A view that will be displayed in NepTunes' preferences. Override this method.
    ///
    /// ## Overview
    /// This view will be stacked on the background returned by `previewBackgroundView()`.
    /// It's recommended to return your theme in it, but keep in mind that the preview can be
    /// used even if there is no player running, so please provide a default track info that
    /// will be displayed in this case.
    ///
    /// ## Notes
    /// ``Theme`` class provides an overridable static variable ``previewTrack`` with title, artist
    /// and album that you can use in your preview.
    ///
    /// - Returns: a view wrapped in AnyView
    open func themePreview() -> AnyView {
        assertionFailure()
        return AnyView(
            Text("Preview").foregroundColor(.white)
        )
    }

    /// A view that will display preferences for this theme
    ///
    /// Please override this method if your theme has preferences
    /// - Returns: a preferences view wrapped in AnyView
    open func preferencesView() -> AnyView? {
        return nil
    }

    /// A view that will be used for the background of your theme in NepTunes' preferences
    ///
    /// ## Discussion
    /// By default this view will return black color but you can be creative,
    /// because this view can be anything – image, gradient etc.
    /// Built in themes display themself color based on track's artwork or user's desktop picture.
    ///
    /// ## Note
    /// Don't assume the size of the preview. It can change in the future version of the app.
    ///
    /// - Returns: a background view wrapped in AnyView
    open func previewBackgroundView() -> AnyView {
        AnyView(
            Color.black
        )
    }

    /// A window that will be used to present the theme on user's desktop. Override it.
    ///
    /// ## Discussion
    /// The most crucial method of the ``Theme`` class.
    /// Your job is to create a ``ThemeWindow`` and set its content view to your theme's view
    /// and return the window. In its basic implementation you would use it as follows:
    /// ```swift
    /// override func themeWindow() -> ThemeWindow {
    ///    let window = super.themeWindow()
    ///    window.contentView = YourThemeView()
    ///    return window
    /// }
    /// ```
    ///
    /// ## Notes
    /// - By default, NepTunesKit provides a ``ThemeWindow`` class,
    /// that displays a transparent, draggable window. Override it if you need custom behavior.
    /// - The window will be owned and managed by the app.
    /// - This method will be called once when the theme is about to appear on screen.
    open func themeWindow() -> ThemeWindow {
        let window = ThemeWindow(identifier: info.identifier)
        return window
    }

    /// Describes the default behavior that you'd prefer for your theme.
    /// The user can change it in the app's preferences.
    open func defaultThemeWindowBehavior() -> ThemeWindowBehavior {
        return .stuck
    }


    public static func ==(lhs: Theme, rhs: Theme) -> Bool {
        lhs.info.identifier == rhs.info.identifier && lhs.info.name == rhs.info.name
    }

    public var id: String { info.identifier }

    /// Helper method that you can use to display a track in preview, even if
    /// there is no music player running
    open class var previewTrack: Track {
        Track(title: "Title", artist: "Artist", album: "Album")
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
