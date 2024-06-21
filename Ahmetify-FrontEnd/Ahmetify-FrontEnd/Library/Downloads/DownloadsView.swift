//
//  DownloadsView.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 20.06.2024.
//

import SwiftUI

struct DownloadsView: View {
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .center){
                Text("Henüz İndirilmiş Yok")
                    .font(.system(size: 25)).bold()
                    .foregroundColor(.white)
                HStack {
                    Text("Bu işarete")
                        .kerning(-0.2)
                    Image(systemName: "arrow.down.circle")
                    VStack {
                        Text("internetsiz bölümler dinlemek için tıkla")
                            .kerning(-0.2)
                    }
                }.foregroundColor(.white)
                .font(.system(size: 12))
                .padding(.top, 3)
                .padding(.bottom)
                
                Button("KEŞFET") {
                    
                }
                .padding([.top, .bottom], 10)
                .padding([.leading, .trailing], 25)
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(15)
                
            }
        }
    }
}

struct DownloadsView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadsView()
    }
}
