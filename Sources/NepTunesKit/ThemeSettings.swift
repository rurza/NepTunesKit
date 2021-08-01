//
//  ThemeSettings.swift
//  
//
//  Created by Adam Różyński on 30/07/2021.
//

import Foundation


public protocol ThemeSettingsConvertible {
    func asSettings() -> [ThemeSettings]
}

public struct ThemeSettings: ThemeSettingsConvertible {
    public init(name: String, value: ThemeSettings.Value) {
        self.name = name
        self.value = value
    }

    public var name: String
    public var value: Value

    public enum Value {
        case bool(Bool)
        case int(Int)
        case string(String)
        case group([ThemeSettings])
    }

    public static func make(@ThemeSettingsBuilder _ content: () -> [ThemeSettings])
    -> [ThemeSettings] {
        content()
    }

    public func asSettings() -> [ThemeSettings] { [self] }

}

public extension ThemeSettings {

    struct Group: ThemeSettingsConvertible {
        public var name: String
        @ThemeSettingsBuilder public var settings: () -> [ThemeSettings]

        public init(name: String, @ThemeSettingsBuilder settings: @escaping () -> [ThemeSettings]) {
            self.name = name
            self.settings = settings
        }

        public func asSettings() -> [ThemeSettings] {
            [ThemeSettings(name: name, value: .group(settings()))]
        }
    }

}

@resultBuilder
public struct ThemeSettingsBuilder {
    public static func buildBlock() -> [ThemeSettings] { [] }

    public static func buildBlock(_ settings: ThemeSettings...) -> [ThemeSettings] {
        settings
    }

    public static func buildBlock(_ values: ThemeSettingsConvertible...) -> [ThemeSettings] {
        values.flatMap { $0.asSettings() }
    }
}

