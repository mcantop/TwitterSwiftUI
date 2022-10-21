//
//  AuthHeaderView.swift
//  TwitterSwiftUI
//
//  Created by Maciej on 21/10/2022.
//

import SwiftUI

struct AuthHeaderView: View {
    let title1: String
    let title2: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title1)
            
            Text(title2)
        }
        .font(.largeTitle)
        .fontWeight(.semibold)
        .foregroundColor(.white)
        .frame(height: 260)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading)
        .background(.blue)
        .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

struct AuthHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(title1: "Hello!", title2: "Welcome back")
    }
}
