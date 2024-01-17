//
//  WordProblemsAdSubView.swift
//  testCaseNeuroMathBuddies
//
//  Created by Kiyoma Algama on 12/21/23.
//

import SwiftUI

struct WordProblemsAdSubView: View {
    
    @State private var showRewardAdSub = true
    //to keep track of score
   // TO dismiss
    @Environment(\.dismiss) var dismiss
    //To show the popUp
    @State private var presentPopUpRewardAdSub = false
    @State private var basicAddition = [
        "Nick and Robert are counting chairs. Nick counts 1 chair and Robert counts 1 chair as well. How many chairs were counted altogether?",
        "Gabriela wants to help her teacher by getting pencils and pens. She gets 1 pen and 2 pencils. How many objects does she get in total?",
        "Mary Beth wants to help her teacher by setting up some desks and chairs. She sets up 2 desks and 2 chairs. How many items does she set up?",
        "JJ and Kiana eat chocolate. JJ eats 3 pieces of chocolate and Kiana eats 2 pieces of chocolate. How many pieces of chocolate were eaten?",
        "Mario wants to pick apples and oranges. He picks 1 oranges and 5 apples. How many fruits does he pick altogether?",
        "Somie wants to help his teacher Ms.Thompson by setting out pencils and pens for students. He sets out 5 pen and 2 pencils. How many items does he set out altogether?",
        "Karie likes to collect teddy bears. She has 6 brown teddy bears and 2 orange teddy bears. How many teddy bears does she have altogehter?",
        "Jessica and Maria are reading books. Jessica reads 5 and Maria reads 4. How many books were read altogether?",
        "Ana wants to help her teacher by cleaning up some desks. She cleans 4 chairs and 6 desks. How many objects does Ana clean altogether?",
        "Keisha and Monty are counting chairs. Monty counts 10 chairs and  Keisha counts 1 chair. How many chairs were counted altogether",
        "Nick and Robert are counting chairs. Nick counts 11 chairs and Robert counts 1 chair. How many chairs were counted altogether",
        "Gabriela wants to help her teacher by getting pencils and pens. She gets 1 pen and 12 pencils. How many objects does she get in total?",
        "Mary Beth wants to help her teacher by setting up some desks and chairs. She sets up 12 desks and 2 chairs. How many items does she set up?",
        "JJ and Kiana eat chocolate. JJ eats 3 pieces of chocolate and Kiana eats 12 pieces of chocolate. How many pieces of chocolate were eaten?",
        "Somie wants to help his teacher Ms.Thompson by setting out pencils and pens for students. He sets out 12 pen and 4 pencils. How many items does he set out altogether?",
        "Karie likes to collect teddy bears. She has 7 brown teddy bears and 10 orange teddy bear. How many teddy bears does she have altogehter?",
        "Jessica and Maria are reading books. Jessica reads 4 and Maria reads 14. How many books were read altogether?",
        "Ana wants to help her teacher by cleaning up some desks. She cleans 13 chairs and 6 desks. How many objects does Ana clean altogether?",
        "Ana wants to help her teacher by cleaning up some desks. She cleans 4 chairs and 16 desks. How many objects does Ana clean altogether?"
          ]
    
    @State private var compGen = 0
    @State private var numOne = 0
    //Entered using stepper
    @State private var userAnswer = 0
    //Computer generated answer
    @State private var result = 0
    //for the alert to tell the user whether they are right or nt
    @State private var showingAlert = false
    @State private var correct = false
    @State private var showingCorrectWrong = "correct"
    @State private var totalNumberOfQuestions = 20
    
    //to keep track of score
    @State private var score = 0
    
 

    var body: some View {
        ZStack{
            Color(red: 0.4627, green: 0.8392, blue: 1.0)
                .ignoresSafeArea()
            VStack {
                
                Spacer()
                 
                //Display Question
                Text("Question:  \(basicAddition[compGen])")
                    .accessibilityLabel("Question: \(basicAddition[compGen])")
                    .frame(width: 350, height: 250)
                    .font(.system(size: 24))
                    .fontWeight(.heavy)
                    .padding(30)
                    
                
                
                Spacer()
                Spacer()
                //Display answer section and instructions
                Section ("Instructions: Enter an answer below") {
                    ZStack{
                        Color(red: 0.0, green: 0.7, blue: 0.9)
                        Stepper("Answer:  \(userAnswer)", value: $userAnswer, in: 0...20)
                            .accessibilityLabel("Answer:  \(userAnswer)")
                            .padding(30)
                            .font(.largeTitle)
                        
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    .frame(width: 350, height: 200)
                    
                }
                //Display Score
                
                Section ("\n") {
                    Text("Correct: \(score) of \(totalNumberOfQuestions) ")
                        .accessibilityLabel("Correct: \(score) of \(totalNumberOfQuestions) ")
                        .fontWeight(.heavy)
                        .font(.system(size: 20))
                    
                    Section {
                        //newly added code to make it work
                            if (score >= 2){
                                Button("Play PuppyBounce") {
                                    presentPopUpRewardAdSub.toggle()
                               }
                                .accessibilityLabel("Play PuppyBounce Game")
                                .frame(width: 150, height: 100)
                                .font(.system(size: 19))
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                                .background(.purple)
                                .cornerRadius(10)
                                .fullScreenCover(isPresented: $presentPopUpRewardAdSub, content: puppyView.init)
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
                
                Spacer()
                Spacer()
                Spacer()
            }
        }
    }
            func generateNumbers() {
                numOne = Int.random(in: 2..<20)
                compGen = Int.random(in: 0..<19)
            }
            
            func checker() {
                if ((compGen+2) == userAnswer){
                    print("you are correct")
                    correct = true
                    showingAlert = true
                    showingCorrectWrong = "Correct!"
                    score += 1
                    scoreAdd += 1 
                    modType = 7
                    presentPopUpRewardWordProblems = false
                    
                } else {
                    print("you are incorrect, the answer is \(compGen+2)")
                    showingAlert = true
                    showingCorrectWrong = "Incorrect, the answer  is \(compGen+2)"
                }
            }
        }

#Preview {
    WordProblemsAdSubView()
}
