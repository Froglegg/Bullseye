//
//  ContentView.swift
//  Bullseye
//
//  Created by Hayes Crowley on 11/6/20.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: nil, content: {
            // target row
            Spacer()
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("\(target)")
            }
            Spacer()
            // slider row
            HStack{
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            // hit me button row
            Button(action: {print("button pressed")
                alertIsVisible = true
            })
            {
                Text("Hit me")
            }.alert(isPresented: $alertIsVisible, content: {
                Alert (title: Text("Hello there!"), message: Text("The slider value is \(sliderValueRounded()).\n" + "You scored \(pointsForCurrentRound()) points this round."), dismissButton: .default(Text("Awesome!")))
            })
            Spacer()
         // score row
            HStack{
                Button(action: {print("button pressed!")}, label: {
                    Text("Start Over")
                })
                Spacer()
                Text("Score: ")
                Text("9999999")
                Spacer()
                Text("Round: ")
                Text("999")
                Spacer()
                Button(action:{print("button pressed!")}, label: {
                    Text("Info")
                })
                
            }.padding(.bottom, 20)
            
            
        })
        
    }
    func sliderValueRounded() -> Int{
        return Int(sliderValue.rounded())
    }
    func pointsForCurrentRound()-> Int {
      return 100 - abs((target - sliderValueRounded()))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().previewLayout(.fixed(width: 896, height: 414))
        }
    }
}
