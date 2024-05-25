import Foundation

extension Date {
   static var today: Date { .now }
   static var weekdays: [String] { Calendar.current.weekdaySymbols }
   
   static var indexForCurrentWeekday: Int {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "EEEE"
      let weekdayString = dateFormatter.string(from: today)
      return weekdays.firstIndex(where: \.self == weekdayString) ?? 0
   }
}
