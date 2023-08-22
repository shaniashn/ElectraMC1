//
//  PeralatanViewModel.swift
//  ElectraMC1
//
//  Created by Sha Nia Siahaan on 22/08/23.
//

import Foundation

class PeralatanViewModel: ObservableObject {
    @Published var tools: [Peralatan] = []
    
    var index: Int = 0
    
    var budgetingPlan: [BudgetingModel] {
        return BudgetingViewModel().budgetingList
    }
    
    func addPeralatan(name: String, quantity: Int, power: Int, usageTimePerHour: Int, repeatDays: Int) {
        let addNewTool = Peralatan(index: index, name: name, quantity: quantity, power: power, usageTimePerHour: usageTimePerHour, repeatDays: repeatDays)
        tools.append(addNewTool)
        saveTools()
        index += 1
    }
    
    func getIndex(index: Int) -> Int {
        var resultIndex: Int = -1
        
        for i in 0 ..< tools.count {
            if (tools[i].index == index){
                resultIndex = i
            }
        }
        
        return resultIndex
    }
    
    func editTool(index: Int, name: String, quantity: Int, power: Int, usageTimePerHour: Int, repeatDays: Int) {
        let editTool = Peralatan(index: index, name: name, quantity: quantity, power: power, usageTimePerHour: usageTimePerHour, repeatDays: repeatDays)
        let editedIndex: Int = getIndex(index: index)
        
        tools[editedIndex] = editTool
        saveTools()
    }
    
    func getDetail(index: Int) -> Peralatan {
        var resultData: Peralatan = Peralatan(index: 0, name: "", quantity: 0, power: 0, usageTimePerHour: 0, repeatDays: 0)
        
        for i in tools {
            if (i.index == index){
                resultData = i
            }
        }
        
        return resultData
    }
    
    func saveTools() {
        if let encodedData = try? JSONEncoder().encode(tools) {
            UserDefaults.standard.set(encodedData, forKey: "tools")
        }
    }
    
    func deleteTool(index: Int) {
        let deletedIndex: Int = getIndex(index: index)
        tools.remove(at: deletedIndex)
        saveTools()
    }
    
    func loadTools() {
        if let data = UserDefaults.standard.data(forKey: "tools") {
            if let decodedData = try? JSONDecoder().decode([Peralatan].self, from: data) {
                self.tools = decodedData
            }
        }
    }
    
    func calculateUsagePerday(tool:Peralatan, budgettingPlan: BudgetingModel) -> Double {
        let Wh = Double(tool.power) * Double(tool.quantity) * Double(tool.usageTimePerHour)
        let kWh = Wh/1000
        let budgetDay = kWh * budgettingPlan.tarif
        
        return budgetDay
    }
    
    func calculateUsageCost(tool: Peralatan, budgettingPlan: BudgetingModel) -> Double {
        let budgetDay = calculateUsagePerday(tool: tool, budgettingPlan: budgettingPlan)
        let budgetMonth = budgetDay * Double(tool.repeatDays * 4)
        
        return budgetMonth
    }
    
    func calculateKwhPerDay(tool: Peralatan) -> Double {
        let Wh = Double(tool.power) * Double(tool.quantity) * Double(tool.usageTimePerHour)
        let kWh = Wh/1000
        
        return kWh
    }
    
    func calculateKwhPerMonth(tool:Peralatan) -> Double {
        let kWhPerDay = calculateKwhPerDay(tool: tool)
        let kWhPerMonth = kWhPerDay * Double(tool.repeatDays * 4)
        
        return kWhPerMonth
    }
    
    func calculateTotalUsageCost(budgetingPlan: BudgetingModel) -> Double {
        var totalCost = 0.0
        for tool in tools {
            let cost = calculateUsageCost(tool: tool, budgettingPlan: budgetingPlan)
            totalCost += cost
        }
        return totalCost
    }
    
    func calculateTotalKwh() -> Double {
        var totalKwh = 0.0
        for tool in tools {
            let kWh = calculateKwhPerMonth(tool: tool)
            totalKwh += kWh
        }
        return totalKwh
    }
    
    func customFormat(_ number: Double) -> String  {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        let decimalValue = number.truncatingRemainder(dividingBy: 1)
        
        if (decimalValue == 0){
            formatter.minimumFractionDigits = 0
        } else {
            formatter.minimumFractionDigits = 2
        }
        
        let formattedString = formatter.string(from: NSNumber(value: number))!
        return formattedString
    }
}
