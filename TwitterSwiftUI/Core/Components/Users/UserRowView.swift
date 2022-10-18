//
//  UserRowView.swift
//  TwitterSwiftUI
//
//  Created by Maciej on 19/10/2022.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 16) {
            Circle()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading) {
                Text("joker")
                    .foregroundColor(.black)
                    .font(.subheadline)
                    .bold()
                
                Text("Heath Ledger")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
