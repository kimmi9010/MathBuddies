//
//  CountingView.swift
//  testCaseNeuroMathBuddies
//
//  Created by Kiyoma Algama on 12/20/23.
//

import SwiftUI

var shouldHideCounting = false

struct FullScreenModalViewCounting: View {
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

struct CountingView: View {
    @State private var compGen = 0
    //Entered using stepper
    @State private var userAnswer = 0
    //Computer generated answer
    //for the alert to tell the user whether they are right or nt
    @State private var showingAlert = false
    @State private var correct = false
    @State private var showingCorrectWrong = "correct"
    @State private var totalNumberOfQuestions = 20
    @State private var sequenceArray =  ["1, 2, _?", "2, 3, _?", "3, 4, _?", "4, 5, _?", "5, 6, _?", "6, 7, _?", "7, 8, _?", "8, 9, _?", "9, 10, _?", "10, 11, _?", "11, 12, _?", "12, 13, _?", "13, 14, _?", "14, 15, _?", "15, 16, _?", "16, 17, _?", "17, 18, _?", "18, 19, _?"]
    
    //to keep track of score
    @State private var score = 0
    
    @State private var showRewardCounting = true
    //to keep track of score
   // TO dismiss
    @Environment(\.dismiss) var dismiss
    //To show the popUp
    @State private var presentPopUpRewardCounting = false // I ADDED FOR REWARD SYSTEM
   //To hide the view when dismissing the view
    
   

    var body: some View {
        ZStack{
            Color(red: 0.4627, green: 0.8392, blue: 1.0)
                .ignoresSafeArea()
            VStack {
                
                Spacer()
                
                //Display Question *CHANGE COMP GEN
                Text("What is next: \(sequenceArray[compGen])")
                    .accessibilityLabel("What is next: \(sequenceArray[compGen])")
                    .font(.system(size: 24))
                    .fontWeight(.heavy)
                    .padding(100)
                    .frame(width: 450, height: 150)
                
                
                Spacer()
                Spacer()
                //Display answer section and instructions
                Section ("Instructions: Enter the next number for the sequence below\n") {
                    ZStack{
                        Color(red: 0.0, green: 0.7, blue: 0.9)
                        Stepper("Answer:  \(userAnswer)", value: $userAnswer, in: 0...20)
                            .accessibilityLabel("Answer:  \(userAnswer)")
                            .padding(30)
                            .font(.largeTitle)
                        
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    
                }
                //Display Score
                
                Section ("\n") {
                    Text("Correct: \(score) of \(totalNumberOfQuestions) ")
                        .accessibilityLabel("Correct: \(score) of \(totalNumberOfQuestions)")
                        .fontWeight(.heavy)
                        .font(.system(size: 20))
                    
                    Section { //newly added code to make it work
                        if (score >= 2){
                            Button("Play PuppyBounce") {
                                presentPopUpRewardCounting.toggle()
                           }
                            .accessibilityLabel("Play PuppyBounce Game")
                            .frame(width: 150, height: 100)
                            .font(.system(size: 19))
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .background(.purple)
                            .cornerRadius(10)
                            .fullScreenCover(isPresented: $presentPopUpRewardCounting, content: puppyView.init)
                            .opacity(shouldHideShapes ? 0 : 1) // To hide the button when it needs to be dismissed.
                        
                        if (globalGameScore != 0){
                            Button("Dismiss"){
                                dismiss()
                                }
                            .accessibilityLabel("Dismiss")
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
                            generateNumbers()
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
                compGen = Int.random(in: 0...16)
            }
            
            func checker() {
                if ((compGen+3) == userAnswer){
                    print("you are correct")
                    correct = true
                    showingAlert = true
                    showingCorrectWrong = "Correct!"
                    score += 1
                    scoreAdd += 1 
                    modType = 4
                    presentPopUpRewardCounting = false
                    
                } else {
                    print("you are incorrect, the answer is \(compGen+3)")
                    showingAlert = true
                    showingCorrectWrong = "Incorrect, the answer is to \(sequenceArray[compGen]) is  \(compGen+3)"
                }
            }
}





struct correctView: View {
    @Environment(\.dismiss) var dismiss

        var body: some View {
            Text("Yay, you have finished this level!")
            Button("Press to dismiss") {
                dismiss()
            }
            .font(.title)
            
            .padding()
            .background(.green)
            .clipShape(RoundedRectangle(cornerRadius:20))
            
        }
    }



#Preview {
    CountingView()
}
