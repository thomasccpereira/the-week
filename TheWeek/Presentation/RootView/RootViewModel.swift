import Foundation
import SwiftUI

class RootViewModel: ObservableObject, Identifiable {
   private unowned let coordinator: RootCoordinator
   @Published var weekdays: [String] = Calendar.current.weekdaySymbols
   private var lastWeekdayIndex: Int { weekdays.count - 1 }
   @Published var weekdayIndex = Date.indexForCurrentWeekday
   
   required init(coordinator: RootCoordinator) {
       self.coordinator = coordinator
   }
   
   func moveBackward() {
      withAnimation { weekdayIndex -= 1 }
   }
   
   func moveForward() {
      withAnimation { weekdayIndex += 1 }
   }
}

// MARK: - Layout
extension RootViewModel {
   var isBackwardButtonDisabled: Bool { weekdayIndex == 0 }
   var isForwardButtonDisabled: Bool { weekdayIndex == weekdays.lastIndex }
}

// MARK: - Preview
#if DEBUG && !TESTING
extension RootViewModel {
    static var preview: Self {
        .init(coordinator: RootCoordinator.preview)
    }
}
#endif
