//
//  TrueFalseView.swift
//  testCaseNeuroMathBuddies
//
//  Created by Kiyoma Algama on 12/21/23.
//

import SwiftUI

struct TrueFalseView: View {
    @State private var numOne = 0
    @State private var numTwo = 0 
    //Entered using stepper
    @State private var userAnswer = true
    //Computer generated answer
    @State private var result = true
    //for the alert to tell the user whether they are right or nt
    @State private var showingAlert = false
    @State private var correct = false
    @State private var showingCorrectWrong = "correct"
    @State private var totalNumberOfQuestions = 20
    
    //to keep track of score
    @State private var score = 0
    
    
    @State private var showRewardTrueFalse = true
    //to keep track of score
   // TO dismiss
    @Environment(\.dismiss) var dismiss
    //To show the popUp
    @State private var presentPopUpRewardTrueFalse = false // I ADDED FOR REWARD SYSTEM
   //To hide the view when dismissing the view
  
    var body: some View {
        ZStack{
            Color(red: 0.4627, green: 0.8392, blue: 1.0)
                .ignoresSafeArea()
            VStack {
                
                Spacer()
                
                //Display Question
                Text("Is \(numOne) = \(numTwo)?")
                    .font(.system(size: 24))
                    .fontWeight(.heavy)
                    .padding(100)
                    .frame(width: 400, height: 100)
                    .accessibilityLabel("Is \(numOne) = \(numTwo)?")

                
                
                Spacer()
                Spacer()
                //Display answer section and instructions
                Section ("Instructions: Determine whether the equation above is true or false. Tap on the correct answer \n") {
                    ZStack{
                        Color(red: 0.0, green: 0.7, blue: 0.9)
                        
                        HStack {
                            Button ("True") {
                                userAnswer = true
                                checker()
                                generateNumbers()
                            }  
                            .accessibilityLabel("True")
                            .alert("\(showingCorrectWrong)", isPresented: $showingAlert) {
                                Button("OK", role: .cancel) { }
                            }
                            .accessibilityLabel("\(showingCorrectWrong)")
                            .frame(width: 150, height: 100)
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .background(.blue)
                            .cornerRadius(10)
                            
                            
                            Button ("False") {
                                userAnswer = false
                                checker()
                                generateNumbers()
                            }
                            .accessibilityLabel("False")
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
                        .accessibilityLabel("Correct: \(score) of \(totalNumberOfQuestions)")

                    
                    Section { //newly added code to make it work
                        if (score >= 2){
                            Button("Play PuppyBounce") {
                                presentPopUpRewardTrueFalse.toggle()
                           }
                            .accessibilityLabel("Play PuppyBounce Game")
                            .frame(width: 150, height: 100)
                            .font(.system(size: 19))
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .background(.purple)
                            .cornerRadius(10)
                            .fullScreenCover(isPresented: $presentPopUpRewardTrueFalse, content: puppyView.init)
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
                    }                    }
                }
                
                //Display buttons
            }
        }
            func generateNumbers() {
                    numOne = Int.random(in: 1..<20)
                    numTwo = Int.random(in: 1..<10)
                if (numOne == numTwo) {
                    result = true
                } else {
                    result = false
                }
            }
            
            func checker() {
                if (result == userAnswer){
                    print("you are correct")
                    correct = true
                    showingAlert = true
                    showingCorrectWrong = "Correct!"
                    score += 1
                    modType = 6
                    scoreAdd += 1 
                    presentPopUpRewardTrueFalse = false
                    
                } else {
                    print("you are incorrect, the answer is \(result)")
                    showingAlert = true
                    showingCorrectWrong = "Incorrect, the answer is \(result)"
                }
            }
}

#Preview {
    TrueFalseView()
}
