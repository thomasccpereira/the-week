import SwiftUI

struct RootCoordinatorView: View {
   @ObservedObject var coordinator: RootCoordinator
   
   var body: some View {
      NavigationStack {
         RootView(viewModel: coordinator.rootViewModel)
            .toolbar {
               leftBarButtonItems
               rightBarButtonItems
            }
      }
   }
   
   @ToolbarContentBuilder
   private var leftBarButtonItems: some ToolbarContent {
      ToolbarItem(placement: .topBarLeading) {
         Button {
            withAnimation { coordinator.rootViewModel.moveBackward() }
         } label: {
            Image(systemName: "chevron.left")
         }
      }
   }
   
   @ToolbarContentBuilder
   private var rightBarButtonItems: some ToolbarContent {
      ToolbarItem(placement: .topBarTrailing) {
         Button {
            withAnimation { coordinator.rootViewModel.moveForward() }
         } label: {
            Image(systemName: "chevron.right")
         }
      }
   }
}

// MARK: - Preview
#if DEBUG
#Preview {
   RootCoordinatorView(coordinator: RootCoordinator.preview)
}
#endif

