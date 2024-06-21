//
//  PhotoPickerView.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 20.06.2024.
//

import SwiftUI

struct PhotoPickerView: View {
    @Binding var selectedImage: String
    @Binding var showModal: Bool
    let photos = ["Profile","Profile1", "Profile2", "Profile3"]

    var body: some View {
        VStack {
            Text("Fotoğraf Seç")
                .font(.title)
                .padding()

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(photos, id: \.self) { photo in
                        Image(photo)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .onTapGesture {
                                selectedImage = photo
                                showModal = false
                            }
                    }
                }
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }
}
