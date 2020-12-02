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
    @State var score = 0
    @State var round = 0
    let midnightBlue = Color(red: 0 / 255, green: 51 / 255, blue: 102 / 255)
    
    
    // view modifiers
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content.foregroundColor(Color.white).modifier(Shadow()).font(Font.custom("Arial Rounded MT Bold", fixedSize: 18))
        }
    }
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content.foregroundColor(Color.yellow).modifier(Shadow()).font(Font.custom("Arial Rounded MT Bold", fixedSize: 24))
        }
    }
    struct ButtonTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content.foregroundColor(Color.black).font(Font.custom("Arial Rounded MT Bold", fixedSize: 18))
        }
    }
    struct SmallButtonTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content.foregroundColor(Color.black).font(Font.custom("Arial Rounded MT Bold", fixedSize: 12))
        }
    }
    // view modifiers can modify other view modifiers... just call content.modifier() in the view modifier
    struct Shadow: ViewModifier {
        func body(content: Content) -> some View {
            return content.shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
    }
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: nil, content: {
            // target row
            Spacer()
            HStack {
                Text("Put the bullseye as close as you can to: ").modifier(LabelStyle())
                Text("\(target)").modifier(ValueStyle())
            }
            Spacer()
            // slider row
            HStack{
                Text("1").modifier(LabelStyle())
                Slider(value: $sliderValue, in: 1...100)
                Text("100").modifier(LabelStyle())
            }
            Spacer()
            // hit me button row
            Button(action: {
                alertIsVisible = true
            })
            {
                Text("Hit me").modifier(ButtonTextStyle())
            }.alert(isPresented: $alertIsVisible, content: {
                Alert (title: Text(alertTitle()), message: Text("The slider value is \(sliderValueRounded()).\n" + "You scored \(pointsForCurrentRound()) points this round."), dismissButton: .default(Text("Awesome!")) {
                    score +=  pointsForCurrentRound()
                    target = Int.random(in: 1...100)
                    round += 1
                })
            }).background(Image("Button"))
            Spacer()
            // score row
            HStack{
                Button(action: {
                    score = 0
                    round = 0
                    target = Int.random(in: 1...100)
                    sliderValue = 50.0
                }, label: {
                    HStack{
                        
                        Image("StartOverIcon")
                        Text("Start Over").modifier(SmallButtonTextStyle())
                    }
                }).background(Image("Button"))
                Spacer()
                Text("Score: ").modifier(LabelStyle())
                Text("\(score)").modifier(ValueStyle())
                Spacer()
                Text("Round: ").modifier(LabelStyle())
                Text("\(round)").modifier(ValueStyle())
                Spacer()
                NavigationLink(destination:AboutView()){
                    HStack{
                        Image("InfoIcon")
                        Text("Info").modifier(SmallButtonTextStyle())
                    }
                }.background(Image("Button"))
                
            }.padding(.bottom, 20)
        }).background(Image("Background"), alignment: .center).accentColor(midnightBlue).navigationBarTitle("Bullseye")
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
