//
//  ContentView.swift
//  TenYear
//
//  Created by SHIH-YING PAN on 2019/10/16.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var password = ""
    @State private var showAlert = false
    @State private var right = false
    var pass = "c8763"
    var body: some View {
        VStack {
            Image("蠟筆小新")
            Text("請輸入密碼")
            SecureField("password", text: $password){
                if self.password==self.pass{
                    self.right = true
                }else{
                    self.showAlert = true
                }
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        .sheet(isPresented: self.$right){
            secondview()
        }
        }
        .alert(isPresented: $showAlert) { () -> Alert in
        let result="密碼錯誤"
        return Alert(title: Text(result))
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
