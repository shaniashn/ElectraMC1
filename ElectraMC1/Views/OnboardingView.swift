//
//  OnboardingView.swift
//  ElectraMC1
//
//  Created by Sha Nia Siahaan on 18/08/23.
//

import SwiftUI

struct OnboardingView: View {
    @State private var index = 0
    var onboardingPage: [Onboarding] = onboardingPages

    @StateObject var budgetingViewModel = BudgetingViewModel()
    @StateObject var peralatanViewModel = PeralatanViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    TabView(selection: $index){
                        ForEach(onboardingPage) { page in
                            OnboardingStyle(onboardingData: page)
                                .tag(page.id)
                        }

                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
                
                PrimaryButton(title: "Mulai") {
                    
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

struct OnboardingStyle: View {
    var onboardingData: Onboarding
    
    var body: some View {
        VStack {
            Image(onboardingData.img)
                .resizable()
                .frame(width: 260, height: 285)
                .scaledToFill()
                .padding(.vertical, 30)
            VStack(spacing: 35){
                Text(onboardingData.bigText)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color.blue90)
                
                Text(onboardingData.smallText)
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
