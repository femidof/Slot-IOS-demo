//
//  ContentView.swift
//  Slots Demo
//
//  Created by Phemmy DOF on 2/3/22.
//

import SwiftUI

struct ContentView: View {
    @State private var credits: Int = 1000
    private var symbols = ["apple","star", "cherry"]
    @State private var numbers = [1, 2 , 0]
    private var betAmount = 5
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 200/265, green: 143/255, blue: 32/255)).edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(Color(red: 228/265, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                //                Title
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("SwiftUI Slots")
                        .bold().foregroundColor(.white)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                }.scaleEffect(2)
                Spacer()
                Text("Credits:"+String(credits))
                    .foregroundColor(.black)
                    .padding(.all,10)
                    .background(.white.opacity(0.5))
                    .cornerRadius(20)
                Spacer()
                // Cards
                HStack {
                    Spacer()
                    Image(symbols[numbers[0]]).resizable().aspectRatio(1, contentMode: .fit).background(.white.opacity(0.5)).cornerRadius(20)
                    Image(symbols[numbers[1]]).resizable().aspectRatio(1, contentMode: .fit).background(.white.opacity(0.5)).cornerRadius(20)
                    Image(symbols[numbers[2]]).resizable().aspectRatio(1, contentMode: .fit).background(.white.opacity(0.5)).cornerRadius(20)
                    Spacer()
                }
                Spacer()
                // Botton
                Button {
                   
                    self.numbers[0] = Int.random(in: 0...self.symbols.count - 1)
                    self.numbers[1] = Int.random(in: 0...self.symbols.count - 1)
                    self.numbers[2] = Int.random(in: 0...self.symbols.count - 1)
                    
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                        self.credits += self.betAmount * 10
                    } else {
                        self.credits -= self.betAmount
                    }
                    
                }  label: {
                    Text("Spin")
                        .bold().foregroundColor(.white).padding(.all, 10)
                        .padding([.leading, .trailing], 30)
                        .background(Color.pink)
                        .cornerRadius(20)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
