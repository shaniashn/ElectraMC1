//
//  OnboardingView.swift
//  ElectraMC1
//
//  Created by Sha Nia Siahaan on 18/08/23.
//

import SwiftUI

struct OnboardingView: View {
    @State var selectedTab: Tab = Tab.first
    @State var index: Int = 0
    
    enum Tab: Int {
        case first = 1
        case second = 2
        case third = 3
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    TabView(selection: $selectedTab){
                        OnboardingStyle(img: "img_0", bigText: "Khawatir dengan tagihan listrikmu?", smallText: "Jangan panik! Ayo kita hitung tagihan listrik bulananmu")
                            .tag(Tab.first)
                        OnboardingStyle(img: "img_1", bigText: "Hitung estimasi biaya dengan mudah", smallText: "Kamu bisa hitung estimasi biaya listrik bulanan agar sesuai dengan anggaran biaya bulananmu")
                            .tag(Tab.second)
                        OnboardingStyle(img: "img_2", bigText: "Tentukan rencana tagihan listrikmu", smallText: "Dengan membuat rencana, kamu bisa menghindari tingginya tagihan listrik di akhir bulan, loh!")
                            .tag(Tab.third)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .onAppear {
                        index = selectedTab.rawValue
                        print(index)
                    }
                }
                
                HStack(spacing: 8){
//                    ForEach() { i in
//                        Color.blue50
//                            .opacity(i == index ? 1 : 0.5)
//                            .frame(width: i == index ? 20 : 8, height: 8)
//                            .clipShape(RoundedRectangle(cornerRadius:20))
//                    }
                }
                .padding(30)
                
                PrimaryButton(title: "Mulai") {
                    print("a")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

//struct OnboardingVie: View {
//    @State var index = 0
//    var onboardingPage: [OnboardingModel] = onboardingPages
//
//    var body: some View {
//        NavigationStack {
//            VStack {
//                TabView(selection: $index){
//                    ForEach(onboardingPage) { page in
//                        VStack {
//                            Image(page.img)
//                                .resizable()
//                                .frame(width: 260, height: 285)
//                                .scaledToFill()
//                                .padding(.vertical, 30)
//                            VStack(spacing: 35){
//                                Text(page.bigText)
//                                    .font(.system(size: 28, weight: .bold))
//                                    .foregroundColor(Color.blue100)
//
//                                Text(page.smalltext)
//                                    .foregroundColor(Color.blue120)
//
//                            }
//                            .padding(.horizontal, 50)
//                            .multilineTextAlignment(.center)
//                        }
//                        .onAppear {
//                            index = page.id
//                            print(index)
//                        }
//
//                    }
//
//                }
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//
//                HStack(spacing: 8){
//                    ForEach(0 ..< 3) { i in
//                        Color.blue50
//                            .opacity(i == index ? 1 : 0.5)
//                            .frame(width: i == index ? 20 : 8, height: 8)
//                            .clipShape(RoundedRectangle(cornerRadius:20))
//                    }
//                }
//                .padding(30)
//
//                PrimaryButton(title: "Mulai") {
//                    print("ini", index)
//                }
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .padding()
//    }
//}

struct OnboardingStyle: View {
    var img: String
    var bigText: String
    var smallText: String
    
    var body: some View {
        VStack {
            Image(img)
                .resizable()
                .frame(width: 260, height: 285)
                .scaledToFill()
                .padding(.vertical, 30)
            VStack(spacing: 35){
                Text(bigText)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color.blue90)
                
                Text(smallText)
                    .foregroundColor(Color.blue100)
            }
            .multilineTextAlignment(.center)
            .padding(.horizontal, 50)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
