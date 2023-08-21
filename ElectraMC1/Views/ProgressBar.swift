//
//  ProgressBar.swift
//  ElectraMC1
//
//  Created by Sha Nia Siahaan on 21/08/23.
//

import SwiftUI

//struct ProgressBar: View {
//    var body: some View {
//        ZStack{
//            Circle()
//                .stroke(
//                    Color.white.opacity(0.55),
//                    lineWidth: 14)
//            Circle()
//                .trim(from: 0, to: degreeFunc())
//                .stroke(
//                    Color.myYellow, style: StrokeStyle(lineWidth: 16, lineCap: .round))
//                .rotationEffect(Angle(degrees: -90))
//                .animation(Animation.easeInOut(duration: 1.0))
//            VStack{
//                Text("\(String(format: "%.1f", persentase()))%")
//                    .font(.system(size: 22, weight: .semibold, design: .default))
//                    .foregroundColor(.white)
//                Text("\(toolViewmodell.customFormat(toolViewmodell.calculateTotalKwh()))/\(toolViewmodell.customFormat(budgetHomeViewmodel.budgetingList[0].kWh))kWh")
//                    .font(.system(size: 11, weight: .regular, design: .default))
//                    .foregroundColor(.white)
//            }
//        }
//    }
    
//    func persentase() -> Double {
//        let persen = toolViewmodell.calculateTotalKwh()/budgetHomeViewmodel.budgetingList[0].kWh * 100
//        return persen
//    }
//
//    func degreeFunc() -> Double {
//        let degree = toolViewmodell.calculateTotalKwh()/budgetHomeViewmodel.budgetingList[0].kWh
//        let degree2 = round(degree * 100) / 100.0
//
//        return degree2
//    }
//}
//
//struct ProgressBar_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressBar()
//    }
//}
