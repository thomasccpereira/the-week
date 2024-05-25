import SwiftUI

struct RootView: View {
   @ObservedObject private(set) var viewModel: RootViewModel
   
   var body: some View {
      InfinitePageView(
         selection: $viewModel.weekdayIndex,
         before: { viewModel.correctedIndex(for: $0 - 1) },
         view: { index in
            Text(viewModel.weekdays[index])
               .font(.system(size: 48, weight: .heavy))
         }, after: { viewModel.correctedIndex(for: $0 + 1) }
      )
   }
}

// MARK: - Preview
#if DEBUG
#Preview {
   RootView(viewModel: RootViewModel.preview)
}
#endif
