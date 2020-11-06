//
//  ContentView.swift
//  Bullseye
//
//  Created by Hayes Crowley on 11/6/20.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible:Bool = false
    @State var showKnockKnock:Bool = false
    
    var body: some View {
        
        
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Text("Welcome to my first Swift App!").fontWeight(.semibold).foregroundColor(.green)
            
            Button(action: {print("button pressed")
                
                self.alertIsVisible = true
            })
            {
                Text("Hit me")
            }.alert(isPresented: $alertIsVisible, content: {
                Alert (title: Text("Hello there!"), message: Text("This is my first alert!"), dismissButton: .default(Text("Awesome!")))
            })
            
            Button(action: {
                
                self.showKnockKnock = true
            })
            {
                Text("Knock Knock")
            }.alert(isPresented: $showKnockKnock, content: {
                Alert (title: Text("Who's there?"), message: Text("Some knock knock joke"), dismissButton: .default(Text("huh")))
            })
            
//            Button(action: {
//                self.showKnockKnock = true
//            }){
//                Text("Knock Knock"))
//            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
      ContentView()
        }
            
    }
}
