//
//  BudgetingViewModel.swift
//  ElectraMC1
//
//  Created by Sha Nia Siahaan on 22/08/23.
//

import Foundation

class BudgetingViewModel: ObservableObject {
    @Published var budgetingList: [BudgetingModel] = []
    
    func budgetingTools(tarif: Double, biaya: Double) {
        if budgetingList.isEmpty {
            addBudgeting(tarif: tarif, biaya: biaya)
        } else {
            editBudgeting(tarif: tarif, biaya: biaya)
        }
    }

    func addBudgeting(tarif: Double, biaya: Double) {
        let budgeting = BudgetingModel(
            tarif: tarif,
            biaya: biaya,
            kWh: biaya/tarif
        )
        budgetingList.append(budgeting)
    }
    
    func editBudgeting(tarif: Double, biaya: Double) {
        let budgeting = BudgetingModel(
            tarif: tarif,
            biaya: biaya,
            kWh: biaya/tarif
        )
        
        budgetingList[0] = budgeting
    }
}
