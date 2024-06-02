import SwiftUI

struct WeekdayView: View {
   @ObservedObject private(set) var viewModel: WeekdayViewModel
   
   var body: some View {
      ScrollViewReader { proxy in
         hoursListView(proxy)
            .toolbar {
               ToolbarItem(placement: .principal) {
                  Text(viewModel.weekdayTitle)
                     .font(.bold32)
                     .foregroundStyle(Color.defaultTextColor)
                     .frame(maxWidth: .infinity, alignment: .leading)
               }
            }
      }
   }
   
   @ViewBuilder
   private func hoursListView(_ proxy: ScrollViewProxy) -> some View {
      List {
         ForEach(Array(viewModel.hoursOfDay.enumerated()), id: \.element) { index, hour in
            hourOfDayView(hour)
               .id(index)
         }
         .onAppear {
            proxy.scrollTo(viewModel.indexOfNow, anchor: .top)
         }
      }
      .listStyle(.plain)
   }
   
   @ViewBuilder
   private func hourOfDayView(_ hour: Date) -> some View {
      VStack(spacing: 0) {
         WeekdayHourView(hourText: hour.hourString, quarters: .defaultQuarters)
         
         Divider()
            .frame(height: 1)
      }
      .listRowSeparator(.hidden)
      .listRowInsets(EdgeInsets())
   }
}

// MARK: - Preview
#Preview {
   WeekdayView(viewModel: .preview)
}

