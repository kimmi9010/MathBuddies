//
//  IdentifyNumbers.swift
//  testCaseNeuroMathBuddies
//
//  Created by Kiyoma Algama on 12/20/23.
//

import SwiftUI

struct IdentifyNumbers: View {
    @State private var compGen = 0
    @State private var randomizer = 0
    @State private var randomArray = []
    //Entered using stepper
    @State private var userAnswer = 0
    //Computer generated answer
    //for the alert to tell the user whether they are right or nt
    @State private var showingAlert = false
    @State private var correct = false
    @State private var showingCorrectWrong = "correct"
    @State private var totalNumberOfQuestions = 20
    @State private var verbNumArray =  ["Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen", "Twenty"]
    
    //to keep track of score
    @State private var score = 0
    

    var body: some View {
        ZStack{
            Color(red: 0.4627, green: 0.8392, blue: 1.0)
                .ignoresSafeArea()
            VStack {
                
                Section {
                    Text("Number: \(verbNumArray[compGen])")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .padding(100)
                        .frame(width: 500, height: 300)
                }
                //Display Question *CHANGE COMP GEN
                //Display mini-game
                Section () {
                    Text("Instructions Choose the number that corresponds with the word spelled above.")
                        .frame(width: 350)
                    
                    HStack {
                        Button ("\(compGen)"){
                            checker()
                            compGen = generateNumbers()
                        } .alert("You are \(showingCorrectWrong)", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) { }
                        }
                            .frame(width: 150, height: 100)
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .background(.blue)
                            .cornerRadius(10)
                        
                        
                        Button ("\(compGen)"){
                            checker()
                            compGen = generateNumbers()
                        }  .alert("You are \(showingCorrectWrong)", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) { }
                        }
                            .frame(width: 150, height: 100)
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .background(.blue)
                            .cornerRadius(10)
                    }
                    
                    
                    HStack {
                        Button ("\(compGen)"){
                            checker()
                            compGen = generateNumbers()
                        }  .alert("You are \(showingCorrectWrong)", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) { }
                        }
                            .frame(width: 150, height: 100)
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .background(.blue)
                            .cornerRadius(10)
                        
                        
                        Button ("\(compGen)"){
                            checker()
                            compGen = generateNumbers()
                        }  .alert("You are \(showingCorrectWrong)", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) { }
                        }
                            .frame(width: 150, height: 100)
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .background(.blue)
                            .cornerRadius(10)
                    }
                    //Display Score
                    
                    Section ("\n") {
                        Text("Correct: \(score) of \(totalNumberOfQuestions) ")
                            .fontWeight(.heavy)
                            .font(.system(size: 20))
                        
                        Section {
                            if (score == 20){
                                rewardViewVTwo()
                            }
                        }
                    }
                    
                    //Display buttons
                }
            }
        }
    }
            func generateNumbers() -> Int {
                return Int.random(in: 0...20)
            }
    
    
    mutating func randomizeButtons() {
                for _ in 0...3 {
                    compGen  = generateNumbers()
                    randomArray.append(compGen)
                }
                randomizer = Int.random(in: 0...3)
            }
            
            func checker() {
                if ((compGen) == userAnswer){
                    print("you are correct")
                    correct = true
                    showingAlert = true
                    showingCorrectWrong = "correct"
                    score += 1
                    scoreAdd += 1 
                    
                } else {
                    print("you are incorrect, the answer is \(compGen+3)")
                    showingAlert = true
                    showingCorrectWrong = "wrong, the answer is \(compGen+3)"
                }
            }
}


//Use at very end of levels (2)


#Preview {
    IdentifyNumbers()
}
