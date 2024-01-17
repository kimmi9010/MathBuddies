//
//  EvenOddView.swift
//  testCaseNeuroMathBuddies
//
//  Created by Kiyoma Algama on 12/21/23.
//

import SwiftUI

var shouldHideEvenOdd = false

struct FullScreenModalViewEvenOdd: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color.primary.edgesIgnoringSafeArea(.all)
            Button("Dismiss Modal") {
                dismiss()
            }
        }
    }
}

struct EvenOddView: View {
    @State private var numOne = 0
    //Entered using stepper
    @State private var userAnswer = 0
    //Computer generated answer
    @State private var result = 0
    @State private var evenOdd = "even"
    //for the alert to tell the user whether they are right or nt
    @State private var showingAlert = false
    @State private var correct = false
    @State private var showingCorrectWrong = "correct"
    @State private var totalNumberOfQuestions = 20
    
     
    //Band-Aid for currrent scoring problem
    @State private var taps = 0
    
    //to keep track of score
    @State private var score = 0
     
    
    //Show the reward screen
    @State private var showRewardEvenOdd = true
    //to keep track of score
   // TO dismiss
    @Environment(\.dismiss) var dismiss
    //To show the popUp
    @State private var presentPopUpRewardEvenOdd = false // I ADDED FOR REWARD SYSTEM
   //To hide the view when dismissing the view
    
  
    var body: some View {
        ZStack{
            Color(red: 0.4627, green: 0.8392, blue: 1.0)
                .ignoresSafeArea()
            VStack {
                
                Spacer()
                
                //Display Question
                Text("Is \(numOne) even or odd?")
                    .font(.system(size: 24))
                    .fontWeight(.heavy)
                    .padding(100)
                    .frame(width: 450, height: 150)
                    .accessibilityLabel("Is \(numOne) even or odd?")
                
                 
                Spacer()
                Spacer()
                //Display answer section and instructions
                Section ("Instructions: Tap on the correct answer \n") {
                    ZStack{
                        Color(red: 0.0, green: 0.7, blue: 0.9)
                        
                        HStack {
                            Button ("Even") {
                                userAnswer = 10
                                checker()
                                generateNumbers()
                            }   .accessibilityLabel("Even")
                                .alert("\(showingCorrectWrong)", isPresented: $showingAlert) {
                                Button("OK", role: .cancel) { }
                            }
                            .accessibilityLabel("\(showingCorrectWrong)")
                            .frame(width: 150, height: 100)
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .background(.blue)
                            .cornerRadius(10)
                             
                            
                            Button ("Odd") {
                                userAnswer = 20
                                checker()
                                generateNumbers()
                            }
                            .accessibilityLabel("Odd")
                            .alert("\(showingCorrectWrong)", isPresented: $showingAlert) {
                                Button("OK", role: .cancel) { }
                            }
                            .accessibilityLabel("\(showingCorrectWrong)")
                            .frame(width: 150, height: 100)
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .background(.blue)
                            .cornerRadius(10)
                        }
                            
                        
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    
                }
                //Display Score
                
                Section ("\n") {
                    Text("Correct: \(score) of \(totalNumberOfQuestions) ")
                        .fontWeight(.heavy)
                        .font(.system(size: 20))
                    
                    Section { //newly added code to make it work
                        if (score >= 2){
                            Button("Play PuppyBounce") {
                                presentPopUpRewardEvenOdd.toggle()
                           }
                            .accessibilityLabel("Play PuppyBounce Game")
                            .frame(width: 150, height: 100)
                            .font(.system(size: 19))
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .background(.purple)
                            .cornerRadius(10)
                            .fullScreenCover(isPresented: $presentPopUpRewardEvenOdd, content: puppyView.init)
                            .opacity(shouldHideShapes ? 0 : 1) // To hide the button when it needs to be dismissed.
                        
                        if (globalGameScore != 0){
                            Button("Dismiss"){
                                dismiss()
                                }
                            .accessibilityLabel("Game")
                            .frame(width: 150, height: 100)
                            .font(.system(size: 19))
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .background(.purple)
                            .cornerRadius(10)
                            }
                     
                        }
                    }              
                }
                
                //Display buttons
                Section {
                    HStack{
                        Button("Check answer"){
                            checker()
                        }
                        .accessibilityLabel("Check answer")
                        .alert("\(showingCorrectWrong)", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) { }
                        }
                        .accessibilityLabel("\(showingCorrectWrong)")
                        .frame(width: 150, height: 100)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .background(.blue)
                        .cornerRadius(10)
                    }
                }
                .frame(width: 300, height: 200)
                 
                
            }
        }
    }
            func generateNumbers() {
                numOne = Int.random(in: 0...20)
                if (numOne % 2 == 0) {
                    result = 10 //random numbers to make it work
                    evenOdd  = "even"
                } else {
                    result = 20
                    evenOdd = "odd"
                }
            }
            
            func checker() {
                if (result == userAnswer
                || taps == 0){
                    print("you are correct")
                    correct = true
                    showingAlert = true
                    showingCorrectWrong = "Correct!"
                    score += 1
                    scoreAdd += 1 
                    modType = 2
                    taps += 1
                    presentPopUpRewardEvenOdd = false
                    
                } else {
                    print("you are incorrect, the answer is \(result).")
                    showingAlert = true
                    showingCorrectWrong = "Incorrect, the answer to \(numOne) is \(evenOdd)."
                }
            }
}

#Preview {
    EvenOddView()
}
