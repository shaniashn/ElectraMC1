//
//  TextStyle.swift
//  ElectraMC1
//
//  Created by Sha Nia Siahaan on 18/08/23.
//

import SwiftUI

struct TextStyle: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

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
