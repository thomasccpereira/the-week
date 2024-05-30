import SwiftUI

struct WeekdayView: View {
   @ObservedObject private(set) var viewModel: WeekdayViewModel
   
   var body: some View {
      ScrollViewReader { proxy in
         hoursListView(proxy)
            .toolbar {
               ToolbarItem(placement: .principal) {
                  Text(viewModel.weekdayTitle)
                     .font(.bold16)
                     .foregroundStyle(Color.defaultTextColor.opositeText)
               }
            }
            .onAppear {
               proxy.scrollTo(viewModel.indexOfNow)
            }
      }
   }
   
   @ViewBuilder
   private func hoursListView(_ proxy: ScrollViewProxy) -> some View {
      List(selection: $viewModel.selectedHour) {
         hourOfDayView(proxy)
      }
      .listStyle(.plain)
   }
   @ViewBuilder
   private func hourOfDayView(_ proxy: ScrollViewProxy) -> some View {
      ForEach(Array(viewModel.hoursOfDay.enumerated()), id: \.element) { index, hour in
         VStack(spacing: 0) {
            WeekdayHourView(hourText: hour.hourString, quarters: .defaultQuarters)
            
            Divider()
               .frame(height: 1)
         }
         .listRowSeparator(.hidden)
         .listRowInsets(EdgeInsets())
         .tag(index)
      }
   }
}

// MARK: - Preview
#Preview {
   WeekdayView(viewModel: .preview)
}

