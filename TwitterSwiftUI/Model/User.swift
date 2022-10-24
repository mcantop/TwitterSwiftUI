//
//  User.swift
//  TwitterSwiftUI
//
//  Created by Maciej on 23/10/2022.
//

import FirebaseFirestoreSwift
import Firebase

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profilePhotoUrl: String
    let email: String
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == id }
}
