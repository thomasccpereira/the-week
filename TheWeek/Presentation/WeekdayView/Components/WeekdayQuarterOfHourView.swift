import Foundation
import SwiftUI

typealias QuarterOfHour = WeekdayQuarterOfHourView.QuarterOfHour

struct WeekdayQuarterOfHourView: View {
   enum QuarterOfHour: Int {
      case `first` = 15
      case second = 30
      case third = 45
      case `last` = 60
      
      var text: String { "\(self.rawValue)" }
      
      var backgroundColor: Color {
         switch self {
         case .first: .firstQuarterOfHour
         case .second: .secondQuarterOfHour
         case .third: .thirdQuarterOfHour
         case .last: .lastQuarterOfHour
         }
      }
   }
   
   let quarter: QuarterOfHour
   private(set) var appointmentText: String? = nil
   private(set) var backgroundColor: Color? = nil
   private var defaultBackgroundColor: Color {
      backgroundColor ?? quarter.backgroundColor
   }
   
   var body: some View {
      HStack(spacing: 8) {
         Text(quarter.text)
            .font(.bold12)
            .foregroundStyle(defaultBackgroundColor.opositeText)
            .padding(.leading, 8)
         
         appointmentTextView
      }
      .frame(height: 20)
      .frame(maxWidth: .infinity, alignment: .leading)
      .background(defaultBackgroundColor)
   }
   
   @ViewBuilder
   private var appointmentTextView: some View {
      if let appointmentText {
         Text(appointmentText)
            .font(.bold14)
            .foregroundStyle(Color.defaultTextColor)
      }
   }
}

#Preview {
   VStack(spacing: 20) {
      VStack(spacing: 0) {
         WeekdayQuarterOfHourView(quarter: .first)
         WeekdayQuarterOfHourView(quarter: .second)
         WeekdayQuarterOfHourView(quarter: .third)
         WeekdayQuarterOfHourView(quarter: .last)
      }
      
      VStack(spacing: 0) {
         WeekdayQuarterOfHourView(quarter: .first, appointmentText: "Dentista", backgroundColor: .orange)
         WeekdayQuarterOfHourView(quarter: .second, backgroundColor: .orange)
         WeekdayQuarterOfHourView(quarter: .third)
         WeekdayQuarterOfHourView(quarter: .last)
      }
      
      VStack(spacing: 0) {
         WeekdayQuarterOfHourView(quarter: .first)
         WeekdayQuarterOfHourView(quarter: .second)
         WeekdayQuarterOfHourView(quarter: .third, appointmentText: "Supermercado", backgroundColor: .red)
         WeekdayQuarterOfHourView(quarter: .last, backgroundColor: .red)
      }
   }
}
