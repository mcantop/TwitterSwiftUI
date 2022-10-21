//
//  TweetRowView.swift
//  TwitterSwiftUI
//
//  Created by Maciej on 18/10/2022.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            // MARK: - Profile image + user info + sheet
            HStack(alignment: .center, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        // MARK: - User info
                        Text("Bruce Wayne")
                            .font(.subheadline)
                            .bold()
                        
                        Text("@batman")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    // MARK: - Tweet caption
                    Text("I believe in Harvey Dent")
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
                TweetButton(image: "heart", action: messageButton)
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
        TweetRowView()
    }
}
