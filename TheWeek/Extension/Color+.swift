import SwiftUI

extension Color {
   // WeekdayHour
   // WeekdayQuarterOfHour
   static let firstQuarterOfHour = Color("colours/quartersOfHour/first")
   static let secondQuarterOfHour = Color("colours/quartersOfHour/second")
   static let thirdQuarterOfHour = Color("colours/quartersOfHour/third")
   static let lastQuarterOfHour = Color("colours/quartersOfHour/last")
}

extension Color {
   private var isDarkModeEnabled: Bool { UITraitCollection.current.userInterfaceStyle == .dark }
   var opositeSeparator: Color { isDarkModeEnabled ? self.lighter : self.darker }
   var lighter: Color { Color(UIColor(self).mix(with: .white, amount: 0.5)) }
   var darker: Color { Color(UIColor(self).mix(with: .black, amount: 0.2)) }
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
