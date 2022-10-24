//
//  FeedView.swift
//  TwitterSwiftUI
//
//  Created by Maciej on 18/10/2022.
//

import SwiftUI

struct FeedView: View {
    @State private var showingTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.tweets) { tweet in
                        TweetRowView(tweet: tweet)
                    }
                }
            }
            
            Button {
                showingTweetView.toggle()
            } label: {
                Image(systemName: "pencil.and.outline")
                    .resizable()
                    .bold()
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showingTweetView) {
                NewTweetView()
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
