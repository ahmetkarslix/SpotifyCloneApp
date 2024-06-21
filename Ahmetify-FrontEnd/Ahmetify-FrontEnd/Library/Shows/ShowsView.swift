//
//  ShowsView.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 20.06.2024.
//

import SwiftUI

struct ShowsView: View {
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading){
                ForEach (0..<2) {i in
                    ShowRow(podcasts: Podcast(id: UUID(), img: "Podcast4", podcast: "Dersimiz Fitness", episode: "2: Etkili Antrenman Programı Nasıl Olmalı? Antrenman Programını Fazlara Bölmek Neden Önemli?", network: "Dersimiz Fitness Network", time: "Salı", timeleft: 127, duration: 127, description: "Dersimiz Fitness’ın bu bölümünde, antrenmanlarda sağlıklı bir şekilde devamlı olarak gelişmen için programında belli aralıklarla değişiklik yapman neden önemli ve ne tarz değişiklikler uygulayabilirsin bunlar konuşuldu."))
                }
                Spacer()
            }
        }
    }
}

struct ShowsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowsView()
    }
}
