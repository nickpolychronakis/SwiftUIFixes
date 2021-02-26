//
//  File.swift
//  
//
//  Created by NICK POLYCHRONAKIS on 27/2/21.
//

import SwiftUI


#if os(macOS)
public enum UserInterfaceSizeClass {
    case compact
    case regular
}

public struct HorizontalSizeClassEnvironmentKey: EnvironmentKey {
    public static let defaultValue: UserInterfaceSizeClass = .regular
}
public struct VerticalSizeClassEnvironmentKey: EnvironmentKey {
    public static let defaultValue: UserInterfaceSizeClass = .regular
}

@available(OSX 10.15, *)
public extension EnvironmentValues {
    public var horizontalSizeClass: UserInterfaceSizeClass {
        get { return self[HorizontalSizeClassEnvironmentKey] }
        set { self[HorizontalSizeClassEnvironmentKey] = newValue }
    }
    public var verticalSizeClass: UserInterfaceSizeClass {
        get { return self[VerticalSizeClassEnvironmentKey] }
        set { self[VerticalSizeClassEnvironmentKey] = newValue }
    }
}
#endif
