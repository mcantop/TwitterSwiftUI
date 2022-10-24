//
//  RegistrationView.swift
//  TwitterSwiftUI
//
//  Created by Maciej on 21/10/2022.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {

        VStack {
            AuthHeaderView(title1: "Get Started.", title2: "Create your account!")
            
            .navigationDestination(isPresented: $viewModel.didAuthenticateUser) { ProfilePhotoSelectorView()
            }
 
            VStack(spacing: 40) {
                CustomTextField(image: "envelope", placeholder: "Email", text: $email)
                CustomTextField(image: "person", placeholder: "Username", text: $username)
                CustomTextField(image: "person", placeholder: "Fullname", text: $fullname)
                CustomTextField(image: "lock", placeholder: "Password", isSecureField: true, text: $password)
            }
            .padding(32)
            
            Button {
                viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
            } label: {
                Text("Sign up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10)
            .padding(.horizontal)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 4) {
                    Text("Already have an account?")
                    
                    Text("Sign in")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
            }
            .padding(.bottom, 32)
            
        }
        .ignoresSafeArea()
            
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .environmentObject(AuthViewModel())
    }
}
