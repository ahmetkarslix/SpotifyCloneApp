//
//  ShowRow.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 20.06.2024.
//

import SwiftUI

struct ShowRow: View {
    var podcasts: Podcast
    var body: some View {
        
        HStack{
            Image(podcasts.img)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
                .cornerRadius(5)
            VStack(alignment: .leading){
                Text(podcasts.podcast)
                    .font(.system(size: 15, weight: .bold))
                Text("Son Güncelleme \(podcasts.time) • \(podcasts.network)")
                    .font(.system(size: 13, weight: .bold))
                    .opacity(0.7)
            }.foregroundColor(.white)
            Spacer()
        }
    }
}

struct ShowRow_Previews: PreviewProvider {
    static var previews: some View {
        ShowRow(podcasts: Podcast(id: UUID(), img: "Podcast4", podcast: "Dersimiz Fitness", episode: "2: Etkili Antrenman Programı Nasıl Olmalı? Antrenman Programını Fazlara Bölmek Neden Önemli?", network: "Dersimiz Fitness Network", time: "Salı", timeleft: 127, duration: 127, description: "Dersimiz Fitness’ın bu bölümünde, antrenmanlarda sağlıklı bir şekilde devamlı olarak gelişmen için programında belli aralıklarla değişiklik yapman neden önemli ve ne tarz değişiklikler uygulayabilirsin bunlar konuşuldu."))
    }
}
