import SwiftUI

extension View {
   func cardView(backgroundColor: Color = .white,
                 cornerRadius: CGFloat = 6,
                 shadowOpacity: CGFloat = 0.1,
                 shadowRadius: CGFloat = 1,
                 shadowX: CGFloat = 0,
                 shadowY: CGFloat = 2) -> some View {
      self
         .background(backgroundColor)
         .cornerRadius(cornerRadius)
         .shadow(color: .black.opacity(shadowOpacity), radius: shadowRadius, x: shadowX, y: shadowY)
   }
   
   func cornerRadius(_ radius: Double) -> some View {
      modifier(CornerRadiusViewModifier(radius: radius))
   }
}
