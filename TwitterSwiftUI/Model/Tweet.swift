//
//  Tweet.swift
//  TwitterSwiftUI
//
//  Created by Maciej on 24/10/2022.
//

import Firebase
import FirebaseFirestoreSwift

struct Tweet: Identifiable, Codable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    var user: User?
    var didLike: Bool? = false
}
