//
//  BullseyeApp.swift
//  Bullseye
//
//  Created by Hayes Crowley on 11/6/20.
//

import SwiftUI

@main
struct BullseyeApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

