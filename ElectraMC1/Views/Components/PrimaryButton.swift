//
//  PrimaryButton.swift
//  ElectraMC1
//
//  Created by Sha Nia Siahaan on 18/08/23.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            TextPrimaryButtonStyle(text: title)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color.blue50)
                .cornerRadius(8)
                .padding()
        }
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "Mulai") {
            print("working")
        }
    }
}
