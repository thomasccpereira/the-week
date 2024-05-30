import Foundation
import SwiftUI

extension Collection where Element == WeekdayHourView.DataToDisplay {
   static var previewFirstQuarter: [WeekdayHourView.DataToDisplay] {
      [
         .init(quarter: .first, backgroundColor: .orange),
         .init(quarter: .second),
         .init(quarter: .third),
         .init(quarter: .last)
      ]}
   
   static var previewFirstHalf: [WeekdayHourView.DataToDisplay] {
      [
         .init(quarter: .first, backgroundColor: .blue),
         .init(quarter: .second, backgroundColor: .blue),
         .init(quarter: .third),
         .init(quarter: .last)
      ]}
   
   static var previewLastHalf: [WeekdayHourView.DataToDisplay] {
      [
         .init(quarter: .first),
         .init(quarter: .second),
         .init(quarter: .third, backgroundColor: .purple),
         .init(quarter: .last, backgroundColor: .purple)
      ]}
   
   static var previewFourtyFive: [WeekdayHourView.DataToDisplay] {
      [
         .init(quarter: .first, backgroundColor: .pink),
         .init(quarter: .second, backgroundColor: .pink),
         .init(quarter: .third, backgroundColor: .pink),
         .init(quarter: .last)
      ]}
   
   static var previewFull: [WeekdayHourView.DataToDisplay] {
      [
         .init(quarter: .first, backgroundColor: .red),
         .init(quarter: .second, backgroundColor: .red),
         .init(quarter: .third, backgroundColor: .red),
         .init(quarter: .last, backgroundColor: .red)
      ]
   }
}
