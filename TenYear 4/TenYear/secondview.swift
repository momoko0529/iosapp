//
//  secondview.swift
//  TenYear
//
//  Created by User20 on 2019/11/7.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import SwiftUI

struct secondview: View {
    @State private var page2 = false
    @State private var page3 = false
    var body: some View {
        VStack{
            Image("合照")
                .resizable()
                .frame(width:450,height:300)
            HStack{
        Button("調亮度"){
            self.page2 = true
        }
        .sheet(isPresented: self.$page2){
            EditPhotoView()
        }
        Button("猜歌"){
            self.page3 = true
        }
        .sheet(isPresented: self.$page3){
            guessSong()
        }
        }
        }
    }
}

struct secondview_Previews: PreviewProvider {
    static var previews: some View {
        secondview()
    }
}
