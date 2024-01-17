//
//  MultiplicationView.swift
//  testCaseNeuroMathBuddies
//
//  Created by Kiyoma Algama on 12/21/23.
//

import SwiftUI

var shouldHideMulti = false

struct FullScreenModalViewMulti: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color.primary.edgesIgnoringSafeArea(.all)
            Button("Dismiss Modal") {
                dismiss()
            }
            .accessibilityLabel("Dismiss Button")
        }
    }
}

struct MultiplicationView: View {
    @State private var numOne = 0
    @State private var numTwo = 0
    //Entered using stepper
    @State private var userAnswer = 0
    //Computer generated answer
    @State private var result = 0
    //for the alert to tell the user whether they are right or nt
    @State private var showingAlert = false
    @State private var correct = false
    @State private var showingCorrectWrong = "correct"
    @State private var totalNumberOfQuestions = 10
    
    //to keep track of score
    @State private var score = 0
    //Show reward screen
    @State private var showRewardMulti = true
    //To dismiss
    @Environment(\.dismiss) var dismiss
    //To show pupopReward
    @State private var presentPopUpRewardMulti = false
    
  
    var body: some View {
        ZStack{
            Color(red: 0.4627, green: 0.8392, blue: 1.0)
                .ignoresSafeArea()
            VStack {
                
                Spacer()
                
                //Display Question
                Text("What is \(numOne) X \(numTwo) = ?")
                    .font(.system(size: 24))
                    .fontWeight(.heavy)
                    .padding(100)
                    .frame(width: 400, height: 100)
                    .accessibilityLabel("What is \(numOne) X \(numTwo) = ?")
                
                
                
                Spacer()
                Spacer()
                //Display answer section and instructions
                Section ("Instructions: Enter an answer using the stepper \n") {
                    ZStack{
                        Color(red: 0.0, green: 0.7, blue: 0.9)
                        Stepper("Answer:  \(userAnswer)", value: $userAnswer, in: 0...100)
                            .padding(30)
                            .font(.largeTitle)
                            .accessibilityLabel("Instructions: Enter an answer using the stepper \n")
                      
                        
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    
                }
                //Display Score
                
                Section ("\n") {
                    Text("Correct: \(score) of \(totalNumberOfQuestions) ")
                        .fontWeight(.heavy)
                        .font(.system(size: 20))
                        .accessibilityLabel("Correct: \(score) of \(totalNumberOfQuestions) ")
                    
                    Section { //newly added code to make it work
                        if (score >= 2){
                            Button("Play PuppyBounce") {
                                presentPopUpRewardMulti.toggle()
                           }
                            .accessibilityLabel("Play PuppyBounce Game")
                            .frame(width: 150, height: 100)
                            .font(.system(size: 19))
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .background(.purple)
                            .cornerRadius(10)
                            .fullScreenCover(isPresented: $presentPopUpRewardMulti, content: puppyView.init)
                            .opacity(shouldHideShapes ? 0 : 1) // To hide the button when it needs to be dismissed.
                        
                        if (globalGameScore != 0){
                            Button("Dismiss"){
                                dismiss()
                                }
                            .accessibilityLabel("Dismiss Game")
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
                        .accessibilityLabel("Check Answer")
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
                    numOne = Int.random(in: 1..<10)
                    numTwo = Int.random(in: 1..<10)
                result = numOne * numTwo
            }
            
            func checker() {
                if (result == userAnswer){
                    print("you are correct")
                    correct = true
                    showingAlert = true
                    showingCorrectWrong = "Correct!"
                    score += 1
                    modType = 1
                    scoreAdd = 2
                 //   presentPopUpRewardMulti = false

                    
                } else {
                    print("you are incorrect, the answer is \(result)")
                    showingAlert = true
                    showingCorrectWrong = "Incorrect, the answer to \(numOne) X \(numTwo) is \(result)"
                }
            }

}

#Preview {
    MultiplicationView()
}
