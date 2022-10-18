//
//  SideMenuViewModel.swift
//  TwitterSwiftUI
//
//  Created by Maciej on 19/10/2022.
//

import Foundation

enum SideMenuViewModel: String, CaseIterable {
    case profile
    case lists
    case bookmarks
    case logout
    
    var title: String { self.rawValue }
    
    var imageName: String {
        switch self {
        case .profile: return "person"
        case .lists: return "list.bullet"
        case .bookmarks: return "bookmark"
        case .logout: return "arrow.left.square"
        }
    }
}
