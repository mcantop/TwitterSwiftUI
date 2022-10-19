//
//  UserStatsView.swift
//  TwitterSwiftUI
//
//  Created by Maciej on 19/10/2022.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 16) {
            HStack(spacing: 8) {
                Text("807")
                    .font(.subheadline)
                    .bold()
                
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            HStack(spacing: 8) {
                Text("19.4K")
                    .font(.subheadline)
                    .bold()
                
                Text("Followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
