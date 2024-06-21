//
//  PodList.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 18.06.2024.
//

import SwiftUI

struct PodList: View {
    var podcasts : Podcast
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading){
                Image(podcasts.img)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                Text(podcasts.podcast)
                    .foregroundColor(.white)
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .padding(.top,2)
                Text("Gösterim - \(podcasts.network)")
                    .foregroundColor(.white)
                    .font(.system(size: 13))
                    .padding(.top,1)
            }
            .frame(width: 150)
        }
    }
}


struct PodList_Previews: PreviewProvider {
    static var previews: some View {
        PodList(podcasts: Podcast(id: UUID(), img: "Podcast6", podcast: "Konuşmazsak Delircez", episode: "Denge: Tutamıyorum Zamanı", network: "Aliye Network", time: "Pzr", timeleft: 40, duration: 47, description: "Herkes gitti ben mi kaldım?(ben kaldım kardeş ben kaldım)"))
    }
}
