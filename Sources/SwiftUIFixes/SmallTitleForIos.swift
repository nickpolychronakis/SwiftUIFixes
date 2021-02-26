//
//  File.swift
//  
//
//  Created by NICK POLYCHRONAKIS on 27/2/21.
//

import SwiftUI


@available(iOS 14.0, *)
@available(OSX 10.15, *)
extension View {
    /// Επειδή το navigationBarTitleDisplayMode δεν υποστηρίζεται στο macOS, έφτιαξα αυτό το extension για να λειτουργεί σωστά και στα δύο λειτουγικά.
    func smallTitleForIos() -> some View {
        #if os(macOS)
        return self
        #else
        return self.navigationBarTitleDisplayMode(.inline)
        #endif
        
    }
}
