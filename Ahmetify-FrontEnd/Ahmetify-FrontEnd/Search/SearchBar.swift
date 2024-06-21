//
//  SearchBar.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 19.06.2024.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var onSearch: () -> Void
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Şarkıcı, Şarkı Ara", text: $text, onCommit: {
                onSearch()
            })
            .foregroundColor(.black)
            
            Button(action: {
                onSearch()
            }) {
                Text("Ara")
                    .foregroundColor(.black)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 1)
    }
}
