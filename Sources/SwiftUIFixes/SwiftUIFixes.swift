
import SwiftUI

// MARK: MACOS



// MARK: TOGGLE SIDEBAR
#if os(macOS)
/// Κρύβει και εμφανίζει την sidebar
func toggleSidebar() {
    NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}

/// Επειδή για το iOS υπάρχει ήδη κουμπί που να κλείνει και να εμφανίζει την sidebar, αλλά για macOS δεν υπάρχει ακόμα, έφτιαξα ένα custom toolbarItem το οποίο θα περιέχει ένα ίδιο κουμπί και για το macOS.
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



// MARK: SIZE CLASS
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

public extension EnvironmentValues {
    var horizontalSizeClass: UserInterfaceSizeClass {
        get { return self[HorizontalSizeClassEnvironmentKey] }
        set { self[HorizontalSizeClassEnvironmentKey] = newValue }
    }
    var verticalSizeClass: UserInterfaceSizeClass {
        get { return self[VerticalSizeClassEnvironmentKey] }
        set { self[VerticalSizeClassEnvironmentKey] = newValue }
    }
}
#endif






// MARK: IOS



// MARK: END EDITING
#if os(iOS)
public extension UIApplication {
    // Το χρησιμοποιώ έτσι:
    // .onTapGesture { UIApplication.shared.endEditing() }
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif


// MARK: BACK BUTTON HIDDEN
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


// MARK: SMALL TITLE
extension View {
    /// Επειδή το navigationBarTitleDisplayMode δεν υποστηρίζεται στο macOS, έφτιαξα αυτό το extension για να λειτουργεί σωστά και στα δύο λειτουγικά.
    public func smallTitleForIos() -> some View {
        #if os(macOS)
        return self
        #else
        return self.navigationBarTitleDisplayMode(.inline)
        #endif
        
    }
}
