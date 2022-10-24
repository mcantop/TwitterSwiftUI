//
//  TweetRowView.swift
//  TwitterSwiftUI
//
//  Created by Maciej on 18/10/2022.
//

import SwiftUI
import Kingfisher
import Firebase

struct TweetRowView: View {
    @ObservedObject var viewModel: TweetRowViewModel
    
    init(tweet: Tweet) {
        self.viewModel = TweetRowViewModel(tweet: tweet)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            // MARK: - Profile image + user info + sheet
            HStack(alignment: .top, spacing: 12) {
                if let user = viewModel.tweet.user {
                    KFImage(URL(string: user.profilePhotoUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                } else {
                    Circle()
                        .frame(width: 56, height: 56)
                        .foregroundColor(.blue)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        // MARK: - User info
                        Text(viewModel.tweet.user?.fullname ?? "Fullname")
                            .font(.subheadline)
                            .bold()
                        
                        Text("@\(viewModel.tweet.user?.username ?? "username")")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    // MARK: - Tweet caption
                    Text(viewModel.tweet.caption)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            
            // MARK: - Action buttons
            HStack {
                TweetButton(image: "bubble.left", action: messageButton)
                Spacer()
                TweetButton(image: "arrow.2.squarepath", action: messageButton)
                Spacer()
                
                Button {
                    viewModel.tweet.didLike ?? false ?
                    viewModel.unlikeTweet() :
                    viewModel.likeTweet()
                } label: {
                    Image(systemName: viewModel.tweet.didLike ?? false ? "heart.fill" : "heart")
                        .font(.subheadline)
                        .foregroundColor(viewModel.tweet.didLike ?? false ? .red : .gray)
                }
                
                Spacer()
                TweetButton(image: "bookmark", action: messageButton)
            }
            .foregroundColor(.gray)
            .padding(.vertical, 4)
            .padding(.horizontal, 16)
            
            Divider()
        }
        .padding(.horizontal)
        .padding(.top, 4)
    }
    
    private func messageButton() {
        print("button click")
    }
}

struct TweetButton: View {
    let image: String
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: image)
                .font(.subheadline)
            
        }
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView(tweet: Tweet(caption: "caption", timestamp: Timestamp(date: Date()), uid: "89318", likes: 2))
    }
}
