//
//  EpisodesView.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 20.06.2024.
//

import SwiftUI

struct EpisodesView: View {
    @State var srch: String = ""
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false)
            {
                VStack(alignment: .leading){
                    NewEpisodes(podcasts: Podcast(id: UUID(), img: "Podcast6", podcast: "Konuşmazsak Delircez", episode: "Denge: Tutamıyorum Zamanı", network: "Aliye Network", time: "Pzr", timeleft: 40, duration: 47, description: "Herkes gitti ben mi kaldım?(ben kaldım kardeş ben kaldım)"))
                    NewEpisodes(podcasts: Podcast(id: UUID(), img: "Podcast2", podcast: "KALT'ın Podcast'i", episode: "KALT'ın Podcast'i / 41.Bölüm / Şifre:Sorma Gir", network: "KALT Network", time: "Dün", timeleft: 100, duration: 409, description: "Kaldırımda bile yetişir denilen çiçekler ekip onlara bile bakamadığımız bahçelerimizin etrafına dijital dikenli teller örüyor, kapısına da annemizin doğum tarihi artı annemizin kızlık memleketinin plakası gibi manyakça parolalar yerleştiriyoruz. Kıymetli hiçbir şeyimiz yokken her şeyimizi saklıyoruz... Oysa şimdi parklarda, rahatsız bankların üzerinde el ele tutuşup birbirimize 'şifre: sorma gir, hepsi küçük' demenin tam zamanı. Birbirimizin bahçelerini ziyaret edeceğiz; sağlıksız, belki de çoktan ölmüş bir ağacın gölgesinde çay içeceğiz, bira içeceğiz. Bahçemize hoş geldiniz...."))
                    NewEpisodes(podcasts: Podcast(id: UUID(), img: "Podcast4", podcast: "Dersimiz Fitness", episode: "2: Etkili Antrenman Programı Nasıl Olmalı? Antrenman Programını Fazlara Bölmek Neden Önemli?", network: "Dersimiz Fitness Network", time: "Salı", timeleft: 127, duration: 127, description: "Dersimiz Fitness’ın bu bölümünde, antrenmanlarda sağlıklı bir şekilde devamlı olarak gelişmen için programında belli aralıklarla değişiklik yapman neden önemli ve ne tarz değişiklikler uygulayabilirsin bunlar konuşuldu."))
                    
                    Text("Bugün")
                        .font(.subheadline)
                        .foregroundColor(.white).bold()
                        .opacity(0.6)
                        .padding(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                                        
                    ForEach (0..<5){i in
                        EpisodeRow(podcasts: Podcast(id: UUID(), img: "Podcast6", podcast: "Konuşmazsak Delircez", episode: "Denge: Tutamıyorum Zamanı", network: "Aliye Network", time: "Pzr", timeleft: 40, duration: 47, description: "Herkes gitti ben mi kaldım?(ben kaldım kardeş ben kaldım)"))
                    }
                    
                    Spacer()
                }
            }
        }.foregroundColor(.white)
    }
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesView()
    }
}
