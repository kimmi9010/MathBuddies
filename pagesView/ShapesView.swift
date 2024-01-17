//
//  ShapesView.swift
//  testCaseNeuroMathBuddies
//
//  Created by Kiyoma Algama on 12/21/23.
//

import SwiftUI
import UIKit

var modType = 0

var shouldHideShapes = false

struct FullScreenModalViewShapes: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color.primary.edgesIgnoringSafeArea(.all)
            Button("Dismiss Modal") { 
                dismiss()
            }
            .accessibilityLabel("A button that dismisses the current view")
        }
    }
}

struct ShapesView: View {
    @State private var compGen = Int.random(in: 0...9)
    @State private var index = 0
    @State private var shapesArray = ["Square", "Rectangle", "Triangle", "Circle", "Diamond", "Trapezoid", "Pentagon", "Hexagon", "Octagon"]
    //Entered using stepper
    @State private var userAnswer = ""
    //Computer generated answer
    @State private var result = 0
    //for the alert to tell the user whether they are right or nt
    @State private var showingAlert = false
    @State private var correct = false
    @State private var showingCorrectWrong = "correct"
    @State private var totalNumberOfQuestions = 15
    //Show the reward screen
    @State private var showRewardShapes = true
    //to keep track of score
    @State private var score = 0
   // TO dismiss
    @Environment(\.dismiss) var dismiss
    //To show the popUp
    @State private var presentPopUpRewardShapes = false // ADDED FOR REWARD SYSTEM
   //To hide the view when dismissing the view

    var body: some View {
        ZStack{
            Color(red: 0.4627, green: 0.8392, blue: 1.0)
                .ignoresSafeArea()
            
            VStack {
                //Display Question
                Spacer()
                Text("What is the shape below called?")
                    .frame(width: 400)
                    .font(.system(size: 22))
                    .fontWeight(.heavy)
                    .padding(45)
                    .accessibilityLabel("What is the shape below called?")
                
                Section {
                    Image("\(shapesArray[compGen])")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .accessibilityLabel("\(shapesArray[compGen])")
                }
                
                Spacer()
                Spacer()
                //Display answer section and instructions
                Section () {
                    Text("Instructions: Click an answer from the drop-down menu 'Shapes'. Once you answer more than 15 questions correctly, you will be able to play a game.")
                        .frame(width: 300, height: 150)
                        .accessibilityLabel("What is the shape below called?")
                                  
                    
                    ZStack{
                        Color(red: 0.0, green: 0.7, blue: 0.9)
                        VStack {
                            HStack {
                                Text("")
                                Menu {
                                    Button(action: {
                                        userAnswer = "Square"
                                        index = 0
                                    }, label: {
                                        Text("Square")
                                            .accessibilityLabel("Square")
                                    })
                                    Button(action: {
                                        userAnswer = "Rectangle"
                                        index = 1
                                    }, label: {
                                        Text("Rectangle")
                                            .accessibilityLabel("Rectangle")
                                    })
                                    Button(action: {
                                        userAnswer = "Triangle"
                                        index = 2
                                    }, label: {
                                        Text("Triangle")
                                            .accessibilityLabel("Triangle")
                                    })
                                    Button(action: {
                                        userAnswer = "Circle"
                                        index = 3
                                    }, label: {
                                        Text("Circle")
                                            .accessibilityLabel("Circle")
                                    })
                                    Button(action: {
                                        userAnswer = "Diamond"
                                        index = 4
                                    }, label: {
                                        Text("Diamond")
                                            .accessibilityLabel("Diamond")
                                    })
                                    Button(action: {
                                        userAnswer = "Trapezoid"
                                        index = 5
                                    }, label: {
                                        Text("Trapezoid")
                                            .accessibilityLabel("Trapezoid")
                                    })
                                    Button(action: {
                                        userAnswer = "Pentagon"
                                        index = 6
                                    }, label: {
                                        Text("Pentagon")
                                            .accessibilityLabel("Pentagon")
                                    })
                                    Button(action: {
                                        userAnswer = "Hexagon"
                                        index = 7
                                    }, label: {
                                        Text("Hexagon")
                                            .accessibilityLabel("Hexagon")
                                    })
                                    Button(action: {
                                        userAnswer = "Octagon"
                                        index = 8
                                    }, label: {
                                        Text("Octagon")
                                            .accessibilityLabel("Octagon")
                                    })
                                } label: {
                                    Label (title: {Text("Shapes ").fontWeight(.heavy).font(.system(size: 40))}, icon: {Image(systemName: "forward.fill")})
                                }
                        }
                            Text("Answer: \(shapesArray[index])").font(.system(size: 25))
                        }
                        
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    
                }
                //Display Score
                Section ("\n") {
                    Text("Correct: \(score) of \(totalNumberOfQuestions)")
                        .fontWeight(.heavy) 
                        .font(.system(size: 20))
                        .accessibilityLabel("Correct: \(score) of \(totalNumberOfQuestions)")
                    
                    
                    Section { //newly added code to make it work
                        if (score >= 15){
                            Button("Play PuppyBounce") {
                                presentPopUpRewardShapes.toggle()
                           }
                            .accessibilityLabel("Play PuppyBounce Button")
                            .frame(width: 150, height: 100)
                            .font(.system(size: 19))
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .background(.purple)
                            .cornerRadius(10)
                            .fullScreenCover(isPresented: $presentPopUpRewardShapes, content: puppyView.init)
                            .opacity(shouldHideShapes ? 0 : 1) // To hide the button when it needs to be dismissed.
                        
                        if (globalGameScore != 0){
                            Button("Dismiss"){
                                dismiss()
                                }
                            .accessibilityLabel("Dismiss Button")
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
                        .accessibilityLabel("Check Answer Button")
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
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
        }
    }
            func generateNumbers() {
                    compGen = Int.random(in: 0..<8)
            }
             
            func checker() {
                if (userAnswer == shapesArray[compGen]){
                    print("you are correct")
                    correct = true
                    showingAlert = true
                    showingCorrectWrong = "Correct! The answer is \(shapesArray[compGen])"
                    score += 1
                    modType = 0
                    scoreAdd = 1

                } else {
                    print("you are incorrect, the answer is \(shapesArray[index])")
                    showingAlert = true
                    showingCorrectWrong = "Incorrect, the answer is \(shapesArray[compGen])"
                }  
            }

} 

#Preview {
    ShapesView()
}
