import Foundation
import SwiftUI

struct WeekdayQuarterOfHourView: View {
   enum QuarterOfHour: Int {
      case `first` = 0
      case second = 15
      case third = 30
      case `last` = 45
      
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
   
   private let quarter: QuarterOfHour
   private let backgroundColor: Color
   
   init(quarter: QuarterOfHour, backgroundColor: Color? = nil) {
      self.quarter = quarter
      self.backgroundColor = backgroundColor ?? quarter.backgroundColor
   }
   
   var body: some View {
      VStack(spacing: 0) {
         Text(quarter.text)
            .font(.bold12)
            .foregroundStyle(backgroundColor.opositeText)
            .frame(height: 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 8)
            .background(backgroundColor)
         
         separatorView
      }
   }
   
   @ViewBuilder
   private var separatorView: some View {
      if quarter == .last {
         Rectangle()
            .fill(backgroundColor.opositeSeparator)
            .frame(height: 2)
            .frame(maxWidth: .infinity)
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
         WeekdayQuarterOfHourView(quarter: .first, backgroundColor: .orange)
         WeekdayQuarterOfHourView(quarter: .second, backgroundColor: .orange)
         WeekdayQuarterOfHourView(quarter: .third)
         WeekdayQuarterOfHourView(quarter: .last)
      }
      
      VStack(spacing: 0) {
         WeekdayQuarterOfHourView(quarter: .first)
         WeekdayQuarterOfHourView(quarter: .second)
         WeekdayQuarterOfHourView(quarter: .third, backgroundColor: .red)
         WeekdayQuarterOfHourView(quarter: .last, backgroundColor: .red)
      }
   }
}
