//
//  Onboarding.swift
//  ElectraMC1
//
//  Created by Sha Nia Siahaan on 21/08/23.
//

import Foundation

struct Onboarding: Identifiable {
    var id: Int?
    var img: String
    var bigText: String
    var smallText: String
}

var onboardingPages: [Onboarding] = [
    Onboarding(id: 0, img: "img_0", bigText: "Khawatir dengan tagihan listrikmu?", smallText: "Jangan panik! Ayo kita hitung tagihan listrik bulananmu"),
    Onboarding(id: 1, img: "img_1", bigText: "Hitung estimasi biaya dengan mudah", smallText: "Kamu bisa hitung estimasi biaya listrik bulanan agar sesuai dengan anggaran biaya bulananmu"),
    Onboarding(id: 2, img: "img_2", bigText: "Tentukan rencana tagihan listrikmu", smallText: "Dengan membuat rencana, kamu bisa menghindari tingginya tagihan listrik di akhir bulan, loh!")
]
