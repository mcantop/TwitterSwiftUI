//
//  RegistrationView.swift
//  TwitterSwiftUI
//
//  Created by Maciej on 21/10/2022.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Get Started.", title2: "Create your account!")
            
            VStack(spacing: 40) {
                CustomTextField(image: "envelope", placeholder: "Email", text: $email)
                CustomTextField(image: "person", placeholder: "Username", text: $username)
                CustomTextField(image: "person", placeholder: "Fullname", text: $fullname)
                CustomTextField(image: "lock", placeholder: "Password", text: $password)
            }
            .padding(32)
            
            Button {
                print("Sign up")
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

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
