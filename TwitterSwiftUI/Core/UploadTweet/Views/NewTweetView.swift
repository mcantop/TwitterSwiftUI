//
//  NewTweetView.swift
//  TwitterSwiftUI
//
//  Created by Maciej on 19/10/2022.
//

import SwiftUI

struct NewTweetView: View {
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    
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
                    dismiss()
                    print(caption)
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
            .padding()
            
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 64, height: 64)
                
                TextArea("What's happening?", text: $caption)
            }
            .padding()
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
