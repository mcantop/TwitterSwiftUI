//
//  NewTweetView.swift
//  TwitterSwiftUI
//
//  Created by Maciej on 19/10/2022.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authModel: AuthViewModel
    @ObservedObject var viewModel = UploadTweetViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                Button {
                    viewModel.uploadTweet(withCaption: caption)
                } label: {
                    Text("Tweet")
                        .foregroundColor(.white)
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(.blue)
                        .clipShape(Capsule())
                }
            }
            .padding(.horizontal)
            
            HStack(alignment: .top) {
                if let user = authModel.currentUser {
                    KFImage(URL(string: user.profilePhotoUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                }
                
                TextArea("What's happening?", text: $caption)
            }
            .padding(.horizontal)
        }
        .onReceive(viewModel.$didUploadedTweet) { success in
            if success {
                dismiss()
            } else {
                // handle error
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
