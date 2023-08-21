//
//  Dashboard.swift
//  ElectraMC1
//
//  Created by Sha Nia Siahaan on 21/08/23.
//

import SwiftUI

struct Dashboard: View {
    @State var addItem: Bool = false
    
    var body: some View {
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
//            .sheet(isPresented: $addItem){
//                Kalkulasi(addItem: $addItem, toolViewModel: toolViewmodell)
//                    .presentationDetents([.medium, .large])
//            }
        }
        .padding(.horizontal, 32)
        VStack(spacing: 22){
            HStack{
                Text("Atur Budgetmu")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Button {
//                    BudgetingPlan(budgetingViewModel: budgetHomeViewmodel, toolViewModell: toolViewmodell)
//                        .navigationBarBackButtonHidden(true)
                } label: {
                    Image(systemName: "square.and.pencil")
                        .font(.system(size: 22, weight: .regular, design: .default))
                        .foregroundColor(.white)
                }
            }
            HStack{
                VStack{
                    VStack(alignment: .leading, spacing: 8){
                        Text("Biaya listrikmu saat ini")
                            .font(.system(size: 15, weight: .medium, design: .default))
                            .foregroundColor(Color("IconTabBar"))
                        HStack (alignment: .bottom){
                            Text("Rp")
                                .font(.system(size: 13, weight: .bold, design: .default))
                                .foregroundColor(.white)
//                            Text("\(toolViewmodell.customFormat(toolViewmodell.calculateTotalUsageCost(budgetingPlan: budgetHomeViewmodel.budgetingList[0])))")
//                                .font(.system(size: 22, weight: .bold, design: .default))
//                                .foregroundColor(.white)
                        }
                        HStack(spacing: 3){
                            Text("Sisa budget")
                                .font(.system(size: 12, weight: .medium, design: .default))
                                .foregroundColor(Color("IconTabBar"))
                            Text("Rp.")
                                .font(.system(size: 12, weight: .medium, design: .default))
                                .foregroundColor(.white)
//                            Text("\(toolViewmodell.customFormat(budgetHomeViewmodel.budgetingList[0].biaya - toolViewmodell.calculateTotalUsageCost(budgetingPlan: budgetHomeViewmodel.budgetingList[0])))")
//                                .font(.system(size: 12, weight: .medium, design: .default))
//                                .foregroundColor(.white)
                        }
                        HStack(spacing: 3){
                            Text("Sisa daya listrik")
                                .font(.system(size: 12, weight: .medium, design: .default))
                                .foregroundColor(Color("IconTabBar"))
//                            Text("\(toolViewmodell.customFormat(budgetHomeViewmodel.budgetingList[0].kWh - toolViewmodell.calculateTotalKwh()))") // masih blm dikurang total kwh
//                                .font(.system(size: 12, weight: .medium, design: .default))
//                                .foregroundColor(.white)
                            Text("kWh")
                                .font(.system(size: 12, weight: .medium, design: .default))
                                .foregroundColor(.white)
                        }
                        
                    }
                }
                
                Spacer()
//                ProgressBar(budgetHomeViewmodel: budgetHomeViewmodel, toolViewmodell: toolViewmodell)
            }
            .frame(width: 328, height: 129)
        }
        
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
