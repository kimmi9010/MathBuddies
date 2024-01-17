//
//  AdditionView.swift
//  testCaseNeuroMathBuddies
//
//  Created by Kiyoma Algama on 12/20/23.
//

import SwiftUI
import AVFoundation
import AVKit

var scoreAdd : Int = 0


var shouldHideAdd = false

struct FullScreenModalViewAdd: View {
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

struct AdditionView: View {
    @State var numOne = 0
    @State private var numTwo = 0
    //Entered using stepper
    @State private var userAnswer = 0
    //Computer generated answer
    @State private var result = 0
    //for the alert to tell the user whether they are right or nt
    @State private var showingAlert = false
    @State private var correct = false
    @State private var showingCorrectWrong = "correct"
    @State private var totalNumberOfQuestions = 20
    
    @State private var score = 0
    //text to speech
    @State private var synthesizer = AVSpeechSynthesizer()
    
    //To present the newView
    @State private var showRewardAdd = true
    //to keep track of score
   // TO dismiss
    @Environment(\.dismiss) var dismiss
    //To show the popUp
    @State private var presentPopUpRewardAdd = false // I ADDED FOR REWARD SYSTEM
   //To hide the view when dismissing the view
    
 

    var body: some View {
        ZStack{
            Color(red: 0.4627, green: 0.8392, blue: 1.0)
                .ignoresSafeArea()
            VStack {
                
                Spacer()
                
                //Display Question
                Text("What is \(numOne)  + \(numTwo) = ?")
                    .font(.system(size: 24))
                    .fontWeight(.heavy)
                    .padding(100)
                    .frame(width: 450, height: 150)
                
                
                
                Spacer()
                Spacer()
                //Display answer section and instructions
                Section ("Instructions: Enter an answer using the stepper \n") {
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
                        .accessibilityLabel("Correct: \(score) of \(totalNumberOfQuestions) ")
                        .fontWeight(.heavy)
                        .font(.system(size: 20))
                    
                    Section { //newly added code to make it work
                        if (score >= 20){
                            Button("Play PuppyBounce") {
                                presentPopUpRewardAdd.toggle()
                           }
                            .accessibilityLabel("Play PuppyBounce Game Button")
                            .frame(width: 150, height: 100)
                            .font(.system(size: 19))
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .background(.purple)
                            .cornerRadius(10)
                            .fullScreenCover(isPresented: $presentPopUpRewardAdd, content: puppyView.init)
                            .opacity(shouldHideShapes ? 0 : 1) // To hide the button when it needs to be dismissed.
                        
                    if (globalGameScore != 0){
                                Button("Dismiss"){
                                    dismiss()
                                    }
                                .frame(width: 150, height: 100)
                                .font(.system(size: 19))
                               .foregroundColor(.white)
                              .fontWeight(.heavy)
                              .background(.green)
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
                numOne = Int.random(in: 1..<11)
                numTwo = Int.random(in: 1..<11)
                result = numOne + numTwo
            }
            
            func checker() {
                if (result == userAnswer){
                    print("you are correct")
                    correct = true
                    showingAlert = true
                    showingCorrectWrong = "Correct!"
                    scoreAdd = 2
                    score += 1
                    modType = 5
                    presentPopUpRewardAdd = false
                    
                } else {
                    print("you are incorrect, the answer is \(result)")
                    showingAlert = true
                    showingCorrectWrong = "Incorrect, the answer to \(numOne) + \(numTwo) is \(result)"
                }
            }
        }

#Preview {
    AdditionView()
}
 
