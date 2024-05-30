import SwiftUI

struct RootView: View {
   @ObservedObject private(set) var viewModel: RootViewModel
   
   var body: some View {
      NavigationStack {
         TabView(selection: $viewModel.weekdayIndex) {
            weekdaysView
         }
         .tabViewStyle(.page(indexDisplayMode: .never))
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
            viewModel.moveBackward()
         } label: {
            Image(systemName: "chevron.left")
         }
         .disabled(viewModel.isBackwardButtonDisabled)
      }
   }
   
   @ToolbarContentBuilder
   private var rightBarButtonItems: some ToolbarContent {
      ToolbarItem(placement: .topBarTrailing) {
         Button {
            viewModel.moveForward()
         } label: {
            Image(systemName: "chevron.right")
         }
         .disabled(viewModel.isForwardButtonDisabled)
      }
   }
   
   @ViewBuilder
   private var weekdaysView: some View {
      ForEach(Array(viewModel.weekdays.enumerated()), id: \.element) { index, weekday in
         let viewModel = WeekdayViewModel(weekday: weekday)
         WeekdayView(viewModel: viewModel)
            .tag(index)
      }
   }
}

// MARK: - Preview
#Preview {
   RootView(viewModel: RootViewModel.preview)
}
