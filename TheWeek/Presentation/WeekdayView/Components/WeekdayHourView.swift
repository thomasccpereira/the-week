import Foundation
import SwiftUI

struct WeekdayHourView: View {
   struct DataToDisplay: Identifiable {
      var id: String { quarter.text }
      let quarter: QuarterOfHour
      private(set) var appointmentText: String? = nil
      private(set) var backgroundColor: Color? = nil
   }
   
   let hourText: String
   let quarters: [DataToDisplay]
   
   var body: some View {
      HStack {
         Text(hourText)
            .font(.medium14)
            .foregroundStyle(Color.defaultTextColor.opositeText)
            .frame(minWidth: 60, alignment: .center)
            .padding(.leading, 8)
         
         quartersView
            .frame(maxWidth: .infinity, alignment: .leading)
      }
   }
   
   @ViewBuilder
   private var quartersView: some View {
      VStack(spacing: 0) {
         ForEach(quarters) { data in
            WeekdayQuarterOfHourView(quarter: data.quarter,
                                     backgroundColor: data.backgroundColor)
         }
      }
   }
}

#Preview {
   VStack(spacing: 0) {
      WeekdayHourView(hourText: "08:00", quarters: .previewFirstQuarter)
      WeekdayHourView(hourText: "09:00", quarters: .previewFirstHalf)
      WeekdayHourView(hourText: "10:00", quarters: .previewLastHalf)
      WeekdayHourView(hourText: "11:00", quarters: .previewFourtyFive)
      WeekdayHourView(hourText: "12:00", quarters: .previewFull)
   }
}
