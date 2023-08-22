//
//  Home.swift
//  ElectraMC1
//
//  Created by Sha Nia Siahaan on 21/08/23.
//

import SwiftUI

struct Home: View {
    @State var addItem: Bool = false
    
    @ObservedObject var budgetHomeViewModel: BudgetingViewModel
    @ObservedObject var peralatanViewModel: PeralatanViewModel
    
    var body: some View {
        NavigationStack {
            HStack{
                VStack{
                    VStack(alignment: .leading, spacing: 8){
                        Text("Biaya listrikmu saat ini")
                            .font(.system(size: 15, weight: .medium, design: .default))
                            .foregroundColor(Color.blue40)
                        HStack (alignment: .bottom){
                            Text("Rp")
                                .font(.system(size: 13, weight: .bold, design: .default))
                                .foregroundColor(.white)
                            Text("\(peralatanViewModel.customFormat(peralatanViewModel.calculateTotalUsageCost(budgetingPlan: budgetHomeViewModel.budgetingList[0])))")
                                .font(.system(size: 22, weight: .bold, design: .default))
                                .foregroundColor(.white)
                        }
                        HStack(spacing: 3){
                            Text("Sisa budget")
                                .font(.system(size: 12, weight: .medium, design: .default))
                                .foregroundColor(Color.blue40)
                            Text("Rp.")
                                .font(.system(size: 12, weight: .medium, design: .default))
                                .foregroundColor(.white)
                            Text("\(peralatanViewModel.customFormat(budgetHomeViewModel.budgetingList[0].biaya - peralatanViewModel.calculateTotalUsageCost(budgetingPlan: budgetHomeViewModel.budgetingList[0])))")
                                .font(.system(size: 12, weight: .medium, design: .default))
                                .foregroundColor(.white)
                        }
                        HStack(spacing: 3){
                            Text("Sisa daya listrik")
                                .font(.system(size: 12, weight: .medium, design: .default))
                                .foregroundColor(Color.blue40)
                            Text("\(peralatanViewModel.customFormat(budgetHomeViewModel.budgetingList[0].kWh - peralatanViewModel.calculateTotalKwh()))")
                                .font(.system(size: 12, weight: .medium, design: .default))
                                .foregroundColor(.white)
                            Text("kWh")
                                .font(.system(size: 12, weight: .medium, design: .default))
                                .foregroundColor(.white)
                        }
                        
                    }
                }
                
                Spacer()
                ProgressBar(budgetHomeViewModel: budgetHomeViewModel, peralatanViewModel: peralatanViewModel)
            }
            .frame(width: 328, height: 129)

            HStack{
                Text("Peralatan Elektronik")
                    .font(.headline)
                    .foregroundColor(Color.blue100)
                Spacer()
                Button {
                    addItem.toggle()
                } label: {
                    Text("Tambah")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 121, height: 44)
                        .background(Color.myYellow)
                        .cornerRadius(12)
                }
                .sheet(isPresented: $addItem){
                    KalkulasiView(addItem: $addItem, toolViewModel: PeralatanViewModel())
                        .presentationDetents([.medium, .large])
                }
            }
            .padding(.horizontal, 32)
            

        }
    }
}
