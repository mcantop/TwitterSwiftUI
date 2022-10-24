//
//  ProfilePhotoSelectorView.swift
//  TwitterSwiftUI
//
//  Created by Maciej on 23/10/2022.
//

import SwiftUI
import PhotosUI

struct ProfilePhotoSelectorView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var profilePhoto: Image?
    @State private var profilePhotoUIImage: UIImage?
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Setup account!", title2: "Add a profile photo")
            
            PhotosPicker(selection: $selectedPhoto, matching: .images) {
                if let profilePhoto = profilePhoto {
                    profilePhoto
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                    //                            .overlay(Circle().stroke(.black, lineWidth: 2))
                        .padding(.top, 32)
                } else {
                    VStack {
                        Text("Tap here to choose your profile pic.")
                        
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFill()
                    }
                    .frame(width: 180, height: 180)
                    .padding(.top, 32)
                }
            }
            .onChange(of: selectedPhoto) { photo in
                Task {
                    if let data = try? await photo?.loadTransferable(type: Data.self) {
                        guard let uiImage = UIImage(data: data) else { return }
                        self.profilePhotoUIImage = uiImage
                        self.profilePhoto = Image(uiImage: uiImage)
                    }
                }
            }
            
            if let profilePhoto = profilePhotoUIImage {
                Button {
                    print(profilePhoto)
                    viewModel.uploadProfilePhoto(profilePhoto)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: 180, maxHeight: 50)
                        .background(.blue)
                        .clipShape(Capsule())
                        .padding()
                        .padding(.horizontal)
                }
                .padding(.top)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
            .environmentObject(AuthViewModel())
    }
}
