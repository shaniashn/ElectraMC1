//
//  ProgressBar.swift
//  ElectraMC1
//
//  Created by Sha Nia Siahaan on 21/08/23.
//

import SwiftUI

struct ProgressBar: View {
    @ObservedObject var budgetHomeViewModel: BudgetingViewModel
    @ObservedObject var peralatanViewModel: PeralatanViewModel
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(
                    Color.white.opacity(0.55),
                    lineWidth: 14)
            Circle()
                .trim(from: 0, to: degreeFunc())
                .stroke(
                    Color.myYellow, style: StrokeStyle(lineWidth: 16, lineCap: .round))
                .rotationEffect(Angle(degrees: -90))
            
            VStack{
                Text("\(String(format: "%.1f", persentase()))%")
                    .font(.system(size: 22, weight: .semibold, design: .default))
                    .foregroundColor(.white)
                Text("\(peralatanViewModel.customFormat(peralatanViewModel.calculateTotalKwh()))/\(peralatanViewModel.customFormat(budgetHomeViewModel.budgetingList[0].kWh))kWh")
                    .font(.system(size: 11, weight: .regular, design: .default))
                    .foregroundColor(.white)
            }
        }
    }
    
    func persentase() -> Double {
        let persen = peralatanViewModel.calculateTotalKwh()/budgetHomeViewModel.budgetingList[0].kWh * 100
        return persen
    }

    func degreeFunc() -> Double {
        let degree = peralatanViewModel.calculateTotalKwh()/budgetHomeViewModel.budgetingList[0].kWh
        let degree2 = round(degree * 100) / 100.0

        return degree2
    }
}

