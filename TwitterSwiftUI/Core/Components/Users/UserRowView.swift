//
//  UserRowView.swift
//  TwitterSwiftUI
//
//  Created by Maciej on 19/10/2022.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    let user: User
    
    var body: some View {
        HStack(spacing: 16) {
            KFImage(URL(string: user.profilePhotoUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 56, height: 56)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .foregroundColor(.black)
                    .font(.subheadline)
                    .bold()
                
                Text(user.fullname)
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
        UserRowView(user: User(username: "PLUTO", fullname: "Future Hendrix", profilePhotoUrl: "", email: "future@gmail.com"))
    }
}
