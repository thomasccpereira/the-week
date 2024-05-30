import SwiftUI

struct RootCoordinatorView: View {
   @ObservedObject private(set) var coordinator: RootCoordinator
   
   var body: some View {
      RootView(viewModel: coordinator.rootViewModel)
   }
}

// MARK: - Preview
#if DEBUG
#Preview {
   RootCoordinatorView(coordinator: RootCoordinator.preview)
}
#endif

