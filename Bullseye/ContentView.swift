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
    @State var score = 0;
    @State var round = 0;
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: nil, content: {
            // target row
            Spacer()
            HStack {
                Text("Put the bullseye as close as you can to: \(target)")
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
            Button(action: {
                alertIsVisible = true
            })
            {
                Text("Hit me")
            }.alert(isPresented: $alertIsVisible, content: {
                Alert (title: Text(alertTitle()), message: Text("The slider value is \(sliderValueRounded()).\n" + "You scored \(pointsForCurrentRound()) points this round."), dismissButton: .default(Text("Awesome!")) {
                    score +=  pointsForCurrentRound()
                    target = Int.random(in: 1...100)
                    round += 1
                })
            })
            Spacer()
            // score row
            HStack{
                Button(action: {
                    score = 0
                    round = 0
                    target = Int.random(in: 1...100)
                    sliderValue = 50.0
                }, label: {
                    Text("Start Over")
                })
                Spacer()
                Text("Score: \(score)")
                Spacer()
                Text("Round: \(round)")
                Spacer()
                Button(action:{print("button pressed!")}, label: {
                    Text("Info")
                })
                
            }.padding(.bottom, 20)
        })
        
    }
    func calculateDifference()->Int{
        return abs((target - sliderValueRounded()))
    }
    func sliderValueRounded() -> Int{
        return Int(sliderValue.rounded())
    }
    func pointsForCurrentRound()-> Int {
        let base = 100 - calculateDifference()
        let points: Int
        // calculate bonus
        if calculateDifference() == 0 {
            points = base + 100
        }
        else if calculateDifference() == 1 {
            points = base + 50
        }
        else {
            points = base
        }
        return points
    }
    func alertTitle()-> String {
        let difference = calculateDifference()
        let title: String
        if difference == 0 {
            title = "Perfect!"
        }
        else if difference <= 5{
            title = "You almost had it!"
        }
        else if difference <= 10 {
            title = "Not bad."
        }
        else {
            title = "Are you even trying?"
        }
        return title
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().previewLayout(.fixed(width: 896, height: 414))
        }
    }
}
