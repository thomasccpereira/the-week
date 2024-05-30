import Foundation

class WeekdayViewModel: ObservableObject, Identifiable {
   private let weekday: String
   @Published var hoursOfDay: [Date] = Date.hoursOfDay
   @Published var selectedHour: Date?
   var indexOfNow: Int {
      hoursOfDay.firstIndex(where: \.hour == Date.now.hour) ?? 0
   }
   
   required init(weekday: String) {
      self.weekday = weekday
   }
}

// MARK: - Layout
extension WeekdayViewModel {
   var weekdayTitle: String { weekday }
}

// MARK: - Preview
#if DEBUG && !TESTING
extension WeekdayViewModel {
    static var preview: Self {
       .init(weekday: Date.weekdays.first ?? "")
    }
}
#endif
