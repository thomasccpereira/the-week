import Foundation

extension Date {
   static var today: Date { .now }
   
   static var is24Hour: Bool {
      guard let formatter: String = DateFormatter.dateFormat(fromTemplate: "j", options: 0, locale: Locale.current) else { return false }
      return !formatter.contains("a")
   }
   
   static var weekdays: [String] { Calendar.current.weekdaySymbols }
   static var indexForCurrentWeekday: Int {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "EEEE"
      let weekdayString = dateFormatter.string(from: today)
      return weekdays.firstIndex(where: \.self == weekdayString) ?? 0
   }
   
   static var hoursOfDay: [Date] {
      var startHour = 0
      var hoursOfDay: [Date] = []
      while startHour < 24 {
         let hour = Date(hour: startHour, minute: 0)
         hoursOfDay.append(hour)
         startHour += 1
      }
      return hoursOfDay
   }
   
   init(hour: Int, minute: Int) {
      var dateComponents = Calendar.current.dateComponents([.year, .month, .day], from: .now)
      dateComponents.hour = hour
      dateComponents.minute = minute
      self = Calendar.current.date(from: dateComponents) ?? .now
   }
   
   var day: Int { Calendar.current.dateComponents([.day], from: self).day ?? 0 }
   var month: Int { Calendar.current.dateComponents([.month], from: self).month ?? 0 }
   var year: Int { Calendar.current.dateComponents([.year], from: self).year ?? 0 }
   var hour: Int { Calendar.current.dateComponents([.hour], from: self).hour ?? 0 }
   var hourString: String {
      let dateFormat = Date.is24Hour ? "HH:mm" : "h:mm a"
      let formatter = DateFormatter()
      formatter.dateFormat = dateFormat
      return formatter.string(from: self)
   }
   var minute: Int { Calendar.current.dateComponents([.minute], from: self).minute ?? 0 }
}
