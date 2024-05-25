import SwiftUI
import SwiftData

@main
struct TheWeekApp: App {
   @StateObject var coordinator = RootCoordinator()
   
   var body: some Scene {
      WindowGroup {
         RootCoordinatorView(coordinator: coordinator)
      }
   }
}
