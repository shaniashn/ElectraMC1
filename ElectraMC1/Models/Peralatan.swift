//
//  Peralatan.swift
//  ElectraMC1
//
//  Created by Sha Nia Siahaan on 22/08/23.
//

import Foundation

struct Peralatan: Codable, Hashable {
    var index: Int
    var name: String
    var quantity: Int
    var power: Int
    var usageTimePerHour: Int
    var repeatDays: Int

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    static func == (lhs: Peralatan, rhs: Peralatan) -> Bool {
        return lhs.name == rhs.name
    }
}
