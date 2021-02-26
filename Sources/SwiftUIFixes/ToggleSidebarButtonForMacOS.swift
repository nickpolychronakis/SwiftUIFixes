//
//  File.swift
//  
//
//  Created by NICK POLYCHRONAKIS on 27/2/21.
//

import SwiftUI

#if os(macOS)
/// Κρύβει και εμφανίζει την sidebar
@available(OSX 10.11, *)
func toggleSidebar() {
    NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}

/// Επειδή για το iOS υπάρχει ήδη κουμπί που να κλείνει και να εμφανίζει την sidebar, αλλά για macOS δεν υπάρχει ακόμα, έφτιαξα ένα custom toolbarItem το οποίο θα περιέχει ένα ίδιο κουμπί και για το macOS.
@available(OSX 11.0, *)
public struct macosToggleSidebar: ToolbarContent {
    public var body: some ToolbarContent {
        ToolbarItem {
            Button(action: toggleSidebar, label: {
                Image(systemName: "sidebar.left")
            })
        }
    }
    
}
#endif
