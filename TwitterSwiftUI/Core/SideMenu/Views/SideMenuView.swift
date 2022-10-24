//
//  SideMenuView.swift
//  TwitterSwiftUI
//
//  Created by Maciej on 19/10/2022.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading) {
                    if let user = authViewModel.currentUser {
                        KFImage(URL(string: user.profilePhotoUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                    } else {
                        Circle()
                            .frame(width: 48, height: 48)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(authViewModel.currentUser?.fullname ?? "Fullname")
                            .font(.subheadline)
                            .bold()

                        Text("@\(authViewModel.currentUser?.username ?? "username")")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    UserStatsView()
                        .padding(.vertical)
                }
                .padding(.leading)
                
                ForEach(SideMenuViewModel.allCases, id: \.self) { viewModel in
                    if viewModel == .profile {
                        NavigationLink {
                            if let user = authViewModel.currentUser {
                                ProfileView(user: user)
                            }
                        } label: {
                            SideMenuOptionRowView(viewModel: viewModel)
                        }
                    } else if viewModel == .logout {
                        Button {
                            authViewModel.logout()
                        } label: {
                            SideMenuOptionRowView(viewModel: viewModel)
                        }
                    } else {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                }
                
                Spacer()
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
            .environmentObject(AuthViewModel())
    }
}

