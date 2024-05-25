import Foundation

class RootViewModel: ObservableObject, Identifiable {
   private unowned let coordinator: RootCoordinator
   @Published var weekdays: [String] = Calendar.current.weekdaySymbols
   private var lastWeekdayIndex: Int { weekdays.count - 1 }
   @Published var weekdayIndex = Date.indexForCurrentWeekday
   
   required init(coordinator: RootCoordinator) {
       self.coordinator = coordinator
   }
   
   func moveBackward() {
      if weekdayIndex == 0 {
         weekdayIndex = weekdays.lastIndex
         return
      }
      weekdayIndex -= 1
   }
   
   func moveForward() {
      if weekdayIndex == weekdays.lastIndex {
         weekdayIndex = 0
         return
      }
      weekdayIndex += 1
   }
   
   func correctedIndex(for index: Int) -> Int {
      let count = weekdays.count
      return (count + index) % count
   }
}

// MARK: - Preview
#if DEBUG && !TESTING
extension RootViewModel {
    static var preview: Self {
        .init(coordinator: RootCoordinator.preview)
    }
}
#endif
