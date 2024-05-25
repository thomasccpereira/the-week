import SwiftUI

class RootCoordinator: ObservableObject, Identifiable {
    @Published var rootViewModel: RootViewModel!
    
    required init() {
        self.rootViewModel = RootViewModel(coordinator: self)
    }
}

// MARK: - Preview
#if DEBUG
extension RootCoordinator {
    static var preview: Self {
        .init()
    }
}
#endif

