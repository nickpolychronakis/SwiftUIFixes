//
//  EndEditingExtension.swift
//  iStopDrugs
//
//  Created by NICK POLYCHRONAKIS on 18/7/20.
//  Copyright © 2020 NICK POLYCHRONAKIS. All rights reserved.
//

import SwiftUI

#if os(iOS)
public extension UIApplication {
    // Το χρησιμοποιώ έτσι:
    // .onTapGesture { UIApplication.shared.endEditing() }
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
