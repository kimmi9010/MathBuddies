//
//  ContentView.swift
//  testCaseNeuroMathBuddies
//
//  Created by Kiyoma Algama on 12/7/23.
//

import SwiftUI

//Use at very end of levels (2)

//FIX THIS LATER
struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                HStack{
                    Image("MathBuddiesIcon")
                }
            }
            
            ZStack {
                VStack {
                    VStack {
                 //This is the stuff at the top
                        HomePage()
                            .ignoresSafeArea() 
                    }
                }
            }
        }
    } 
}
     
#Preview {
    ContentView()
}
