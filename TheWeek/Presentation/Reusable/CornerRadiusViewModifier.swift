import SwiftUI

struct CornerRadiusViewModifier: ViewModifier {
   let radius: Double
   
   func body(content: Content) -> some View {
      content
         .clipShape(.rect(cornerRadius: radius))
   }
}
