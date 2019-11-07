//
//  EditPhotoView.swift
//  TenYear
//
//  Created by SHIH-YING PAN on 2019/10/16.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import SwiftUI

extension BlendMode {
    var name: String {
        return "\(self)"
    }
}

struct EditPhotoView: View {
    let blendModes: [BlendMode] = [.screen, .colorDodge, .colorBurn]
    
    var roles = ["林俊傑", "周杰倫", "周興哲", "蕭敬騰","黃麗玲","張惠妹"]

    @State private var selectBlend = BlendMode.screen

    @State private var brightnessAmount: Double = 0
    @State private var selectedIndex = 0
    @State private var sleepAmount = 0
    @State private var open = true
    //@State private var selectDate = Date()
    //let today = Date()
    //let startDate = Calendar.current.date(byAdding: .year, value: -2, to: Date())!
    //var year: Int {
        //Calendar.current.component(.year, from: selectDate)
    //}
    
    var body: some View {
        GeometryReader { geometry in
            
            NavigationView {
                VStack {
                    Toggle("選角",isOn: self.$open)
                    if self.open{
                    Picker(selection: self.$selectedIndex, label: Text("選擇角色")) {
                        ForEach(0..<self.roles.count) { (index) in
                     Text(self.roles[index])
                     }
                        }
                    }
                    
                    
                    
                    ZStack {
                        
                        Image("１２３")
                            .resizable()
                            .brightness(self.brightnessAmount)
                        TenYearImage(width: geometry.size.width,
                                     brightnessAmount: self.brightnessAmount,
                                     selectedIndex:self.selectedIndex)
                            .blendMode(self.selectBlend)
                    }
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.width / 4 * 3)
                    .clipped()

                    Form {
    
                        
                        BrightnessSlider(brightnessAmount: self.$brightnessAmount)
                        
                        Picker("選擇 blend", selection: self.$selectBlend) {
                            
                            ForEach(self.blendModes, id: \.self) { (blendMode) in
                                Text(blendMode.name)
                            }
                        }
                        Stepper(value: self.$sleepAmount) {
                            Text("我喜歡他\(self.sleepAmount)分")
                        }
                        
                    }
                    
                }
            }
            
        }
        
    }
}

struct EditPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        EditPhotoView()
    }
}

struct BrightnessSlider: View {
    
    @Binding var brightnessAmount: Double
    
    var body: some View {
        HStack {
            Text("亮度")
            Slider(value: self.$brightnessAmount, in: 0...1, minimumValueLabel: Image(systemName: "sun.max.fill").imageScale(.small), maximumValueLabel: Image(systemName: "sun.max.fill").imageScale(.large)) {
                Text("")
            }
        }
    }
}

struct TenYearImage: View {
    
    let width: CGFloat
    let brightnessAmount: Double
    let selectedIndex: Int
    var roles = ["林俊傑", "周杰倫", "周興哲", "蕭敬騰","黃麗玲","張惠妹"]
    //var year: Int {
        //return Calendar.current.component(.year, from: selectDate)
    //}
    
    var body: some View {
        Image(self.roles[self.selectedIndex])
                           .resizable()
                           .brightness(self.brightnessAmount)
    }
}
