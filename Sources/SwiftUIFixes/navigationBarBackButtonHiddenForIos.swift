//
//  navigationBarBackButtonHiddenForIos.swift
//  RegExWizard
//
//  Created by NICK POLYCHRONAKIS on 10/1/21.
//

import SwiftUI

public extension View {
    /// Αν η εφαρμογή εκτελείται σε iOS, κρύβει το πίσω κουμπί
    func navigationBarBackButtonHiddenForIos(_ condition: Bool) -> some View {
        #if os(macOS)
        return self
        #else
        return self.navigationBarBackButtonHidden(true)
        #endif
    }
}
