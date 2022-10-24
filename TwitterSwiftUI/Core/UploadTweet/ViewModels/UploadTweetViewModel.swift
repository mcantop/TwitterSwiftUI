//
//  UploadTweetViewModel.swift
//  TwitterSwiftUI
//
//  Created by Maciej on 24/10/2022.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
    @Published var didUploadedTweet = false
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                self.didUploadedTweet = true
            } else {
                
            }
        }
    }
}
