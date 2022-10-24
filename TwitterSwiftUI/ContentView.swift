//
//  ContentView.swift
//  TwitterSwiftUI
//
//  Created by Maciej on 18/10/2022.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showingMenu = false
    
    var body: some View {
        Group {
            // No user logged in.
            if viewModel.userSession == nil {
                LoginView()
            } else {
                mainInterfaceView
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    var mainInterfaceView: some View {
        ZStack(alignment: .topLeading) {
            MainTabView()
                .navigationBarHidden(showingMenu)
            
            if showingMenu {
                ZStack {
                    Color.black.opacity(showingMenu ? 0.25 : 0.0)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                showingMenu.toggle()
                            }
                        }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showingMenu ? 0 : -300, y: 0)
                .background(showingMenu ? Color.white : Color.clear)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    withAnimation(.easeInOut) {
                        showingMenu.toggle()
                    }
                } label: {
                    
                    if let user = viewModel.currentUser {
                    Button {
                        withAnimation(.easeInOut) {
                            showingMenu.toggle()
                        }
                    } label: {
                            KFImage(URL(string: user.profilePhotoUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 32, height: 32)
                                .clipShape(Circle())
                                
                        }
                    .padding(.leading, 12)
                    }
                }
            }
        }
        .onAppear {
            showingMenu = false
        }
    }
}
