//
//  BudgetingPlan.swift
//  ElectraMC1
//
//  Created by Sha Nia Siahaan on 21/08/23.
//

import SwiftUI

struct BudgetingPlan: View {
    @ObservedObject var budgetingViewModel = BudgetingViewModel()
    @ObservedObject var peralatanViewModel = PeralatanViewModel()
    
    @State var budgetInput: Double = 0
    @State var tarifInput: Double = 0
    
    let numberFormatter: NumberFormatter
    
    init(budgetingViewModel: BudgetingViewModel, peralatanViewModel: PeralatanViewModel) {
        self.budgetingViewModel = budgetingViewModel
        self.peralatanViewModel = peralatanViewModel
        if !budgetingViewModel.budgetingList.isEmpty{
            budgetInput = budgetingViewModel.budgetingList[0].biaya
            tarifInput = budgetingViewModel.budgetingList[0].tarif
        }
        
        numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale.current
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.zeroSymbol = ""
    }
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("cash_wallet")
                    .shadow(color: .white.opacity(0.6), radius: 40)
                    .position(.init(x: 200, y: 167))
                
                    VStack {
                        Grid(alignment: .leading, verticalSpacing: 20) {
                            GridRow {
                                Text("Budget")
                                    .font(.system(size: 15, weight: .medium))
                                    .foregroundColor(Color.blue100)
                                TextField("Target Tagihan Listrik/Bulan", value: $budgetInput, format: .number)
                                .font(.system(size: 15, weight: .regular))
                                .keyboardType(.decimalPad)
                                .overlay(
                                    VStack {
                                        Divider().offset(x: 0, y: 15)
                                    }
                                )
                            }
                            .padding(.horizontal, 32)
                            .padding(.vertical, 22)
                            
                            GridRow{
                                Text("Tarif")
                                    .font(.system(size: 15, weight: .medium))
                                    .foregroundColor(Color.blue100)
                                TextField("Tarif Listrik/kWh", value: $tarifInput, format: .number)
                                    .font(.system(size: 15, weight: .regular))
                                    .keyboardType(.decimalPad)
                                    .overlay(
                                        VStack {
                                            Divider().offset(x: 0, y: 15)
                                        }
                                    )
                            }
                            .padding(.horizontal, 32)
                            .padding(.vertical, 22)
                            
                            PrimaryButton(title: "Simpan") {
                               
                            }
                            
                        }
                        .frame(width: .infinity, height: screenHeight/2)
                        
                    }
                    .background(Color.white)
                
                    .cornerRadius(32)
            }
            .background(Color.blue50)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}
