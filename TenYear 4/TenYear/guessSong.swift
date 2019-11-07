//
//  guessSong.swift
//  TenYear
//
//  Created by User20 on 2019/11/7.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import SwiftUI

struct guessSong: View {
    var roles = ["林俊傑", "周杰倫", "周興哲", "蕭敬騰","黃麗玲","張惠妹"]
    var song = ["青花瓷", "以前以後", "我要快樂", "王妃","怎麼了","關鍵詞"]
    @State private var send = false
    @State private var selectedIndex = 0
    @State private var selectedNum = 0
    var body: some View {
        NavigationView {
        VStack{
        Image(self.roles[self.selectedIndex])
            .resizable()
            Picker(selection: self.$selectedIndex, label: Text("選擇角色")) {
                                   ForEach(0..<self.roles.count) { (index) in
                                Text(self.roles[index])
                                }
                                }
            .frame(height: 150)
            .background(Color.blue)
            .foregroundColor(.white)
                Picker(selection: self.$selectedNum, label: Text("哪首是\(self.roles[self.selectedIndex])的歌")) {
                    ForEach(0..<self.song.count) { (index) in
                        Text(self.song[index])
                    }
                }
                .frame(height: 150)
                .background(Color.yellow)
                .foregroundColor(.black)
                NavigationLink(destination: ContentView()) {
                Button("送出"){
                    self.send = true
                }
            }
    }
    .alert(isPresented: $send) { () -> Alert in
       let result: String
        if self.selectedIndex == 0 && self.selectedNum == 5  {
          result = "這是第一次,讓我學習愛情可以康慨又自私,你是我的關鍵詞"
       } else if self.selectedIndex == 1 && self.selectedNum == 0  {
          result = "天青色等煙雨,而我在等你,月色被打撈起起,暈開了結局,如傳世的青花瓷自顧自美麗,你眼帶笑意"
       } else if self.selectedIndex == 2 && self.selectedNum == 4  {
          result = "原來我們都一樣頑固,怎麼會誰都絕口不提要幸福,再也不能牽著你走未來每一步,我們懷念什麼,失去愛那一刻,才曉得"
       }else if self.selectedIndex == 3 && self.selectedNum == 3  {
          result = "夜太美,儘管再危險,總有人黑著眼框熬著夜"
       }else if self.selectedIndex == 4 && self.selectedNum == 1  {
          result = "以前說的不是這種以後,快樂不該變得像彩虹,都要讓大雨淋過,才短暫擁有"
       }else if self.selectedIndex == 5 && self.selectedNum == 2  {
          result = "我要快樂,我要能睡得安穩,有些人,不抱了才溫暖,離開了才不捨,我早應該割捨"
       }else {
          result = "答錯囉"
       }
       return Alert(title: Text(result))
    }
    }
    }
}

struct guessSong_Previews: PreviewProvider {
    static var previews: some View {
        guessSong()
    }
}
