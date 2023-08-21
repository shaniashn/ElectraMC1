//
//  BudgetingPlan.swift
//  ElectraMC1
//
//  Created by Sha Nia Siahaan on 21/08/23.
//

import SwiftUI

struct BudgetingPlan: View {
    @State var budgetInput: Int = 0
    @State var tarifInput: Int = 0
    
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

struct BudgetingPlan_Previews: PreviewProvider {
    static var previews: some View {
        BudgetingPlan()
    }
}
