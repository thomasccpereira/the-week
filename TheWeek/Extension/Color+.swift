import SwiftUI

extension Color {
   // Common
   static let lightGray = Color(.systemGray6)
   static let defaultTextColor = Color("colours/defaultTextColor")
   // WeekdayHour
   // WeekdayQuarterOfHour
   static let firstQuarterOfHour = Color("colours/quartersOfHour/first")
   static let secondQuarterOfHour = Color("colours/quartersOfHour/second")
   static let thirdQuarterOfHour = Color("colours/quartersOfHour/third")
   static let lastQuarterOfHour = Color("colours/quartersOfHour/last")
}

extension Color {
   private var isDarkModeEnabled: Bool { UITraitCollection.current.userInterfaceStyle == .dark }
   var opositeText: Color { isDarkModeEnabled ? self.lighter(0.7) : self.darker(0.4) }
   var opositeSeparator: Color { isDarkModeEnabled ? self.lighter() : self.darker() }
   
   private func lighter(_ amount: CGFloat = 0.5) -> Color {
      Color(UIColor(self).mix(with: .white, amount: amount))
   }
   
   private func darker(_ amount: CGFloat = 0.2) -> Color {
      Color(UIColor(self).mix(with: .black, amount: amount))
   }
}

extension UIColor {
   fileprivate func mix(with color: UIColor, amount: CGFloat) -> UIColor {
      var red1: CGFloat = 0
      var green1: CGFloat = 0
      var blue1: CGFloat = 0
      var alpha1: CGFloat = 0
      
      var red2: CGFloat = 0
      var green2: CGFloat = 0
      var blue2: CGFloat = 0
      var alpha2: CGFloat = 0
      
      getRed(&red1, green: &green1, blue: &blue1, alpha: &alpha1)
      color.getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)
      
      return UIColor(
         red: red1 * (1.0 - amount) + red2 * amount,
         green: green1 * (1.0 - amount) + green2 * amount,
         blue: blue1 * (1.0 - amount) + blue2 * amount,
         alpha: alpha1
      )
   }
}
