
import SwiftUI

/// Thin wrapper around ContentUnavailableView for consistent empty states across the app.
struct EmptyStateView: View {
    let icon: String
    let title: String
    let message: String
    var body: some View {
        
        
        ContentUnavailableView(title, systemImage: icon, description: Text(message))
    }
}
