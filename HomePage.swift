//
//  HomePage.swift
//  testCaseNeuroMathBuddies
//
//  Created by Kiyoma Algama on 12/20/23.
//

import SwiftUI

struct HomePage: View {
    @State private var showingSheet = false
    
    @State private var daysArray = ["Home", "Intro to Counting", "Addition", "Subtraction", "Shapes", "Word Problems - Addition",  "True or False - Equations", "Multiplication", "Even or Odd"]
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    ZStack{
                        Color(.blue)
                        NavigationView {
                            List(0..<9){ num in
                                NavigationLink {
                                    if (num == 0) {
                                        HomePage()
                                    }
                                    if (num == 1) {
                                        CountingView()
                                    }
                                    if (num == 2) {
                                        AdditionView()
                                    }
                                    if (num == 3){
                                        SubtractionView()
                                    }
                                    if (num == 5) {
                                        ShapesView()
                                    }
                                    if (num == 6) {
                                        WordProblemsAdSubView()
                                    }
                                    if (num == 7 ) {
                                        TrueFalseView()
                                    }
                                    if (num == 8) {
                                        MultiplicationView()
                                    }
                                    if (num == 9){
                                        EvenOddView()
                                    }
                                } label: {
                                    HStack{
                                        Text("\(daysArray[num])")
                                            .padding()
                                            .background(.blue)
                                            .accessibilityAddTraits(.isHeader)//Accessibility tools
                                        Image(systemName: "arrow.forward")
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                    
                                }
                                .navigationTitle("Modules")
                                .ignoresSafeArea()
                                .frame(width: 150, height: 105)
                                
                            }
                            //I CAN WRITE HERE!
                            VStack {
                                Text("This app is designed for students with Autism to build foundational math skills such as counting, addition, subtraction, multiplication, identifying shapes and odd and even numbers.\n")
                                Text("To the upper left corner there is an icon that can be clicked on to show the 9 modules avaliable.")
                                Text("In each module, a student who completes 20 questions correctly will be sent to the puppyBounce game. ")
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
                    .hiddenNavigationBarStyle()
                    .background(.blue)

                }
            }
        }
        .background(.black)
        .ignoresSafeArea()
    }
}


struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}

#Preview {
    HomePage()
}
