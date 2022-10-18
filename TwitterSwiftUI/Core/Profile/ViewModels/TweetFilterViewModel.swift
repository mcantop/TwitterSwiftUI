//
//  TweetFilterViewModel.swift
//  TwitterSwiftUI
//
//  Created by Maciej on 18/10/2022.
//

import Foundation

enum TweetFilterViewModel: String, CaseIterable {
case tweets
case replies
case likes
    
    var title: String { self.rawValue }
}
