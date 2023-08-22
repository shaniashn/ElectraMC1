//
//  TextStyle.swift
//  ElectraMC1
//
//  Created by Sha Nia Siahaan on 18/08/23.
//

import SwiftUI

struct TextPrimaryButtonStyle: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color.white)
            .fontWeight(.bold)
    }
}

struct TextStyle_Previews: PreviewProvider {
    static var previews: some View {
        TextPrimaryButtonStyle(text: "Mulai")
    }
}
