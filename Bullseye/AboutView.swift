//
//  AboutView.swift
//  Bullseye
//
//  Created by Hayes Crowley on 12/2/20.
//

import SwiftUI

struct AboutView: View {
    struct HeaderStyle: ViewModifier {
        func body(content:Content)-> some View{
            return content.foregroundColor(Color.black).font(Font.custom("Arial Rounded MT Bold", fixedSize: 30)).padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
        }
    }
    
    struct TextStyle: ViewModifier {
        func body(content:Content)-> some View{
            return content.foregroundColor(Color.black).font(Font.custom("Arial Rounded MT Bold", fixedSize: 16)).padding(EdgeInsets(top: 0, leading: 60, bottom: 20, trailing: 60))
        }
    }
    
    var body: some View {
        Group{
            VStack{
                Text("🎯 Bullseye 🎯").modifier(HeaderStyle())
                Text("This is Bullseye, the game where you can earn points and earn fame by dragging a slider.").modifier(TextStyle())
                Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").modifier(TextStyle())
                Text("Enjoy!").modifier(TextStyle())
            }.navigationBarTitle("About Bullseye").background(Color(red: 255 / 255, green: 214 / 255, blue: 179 / 255)).multilineTextAlignment(.center)
        }.background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
