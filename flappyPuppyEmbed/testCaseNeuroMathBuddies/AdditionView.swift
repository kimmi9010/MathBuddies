//
//  AdditionView.swift
//  testCaseNeuroMathBuddies
//
//  Created by Kiyoma Algama on 10/20/23.
//

import SwiftUI

struct AdditionView: View {
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
                Text("What is \(numOne)  + \(numTwo) = ?")
                    .font(.system(size: 24))
                    .fontWeight(.heavy)
                    .padding(100)
                    .frame(width: 400, height: 100)
                
                
                Spacer()
                Spacer()
                //Display answer section and instructions
                Section ("Instructions: Enter an answer using the stepper \n") {
                    ZStack{
                        Color(red: 0.0, green: 0.7, blue: 0.9)
                        Stepper("Answer:  \(userAnswer)", value: $userAnswer, in: 0...10)
                            .padding(30)
                            .font(.largeTitle)
                        
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    
                }
                //Display Score
                
                Section ("\n") {
                    Text("Correct: \(score) of \(totalNumberOfQuestions) ")
                        .fontWeight(.heavy)
                        .font(.system(size: 20))
                    
                    Section {
                        if (score == 20){
                            correctView()
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
                        .alert("You are \(showingCorrectWrong)", isPresented: $showingAlert) {
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
                    showingCorrectWrong = "correct"
                    score += 1
                    
                } else {
                    print("you are incorrect, the answer is \(result)")
                    showingAlert = true
                    showingCorrectWrong = "wrong, the answer is \(result)"
                }
            }
        }

#Preview {
    AdditionView()
}
