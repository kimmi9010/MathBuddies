//
//  ContentView.swift
//  flappyPuppyEmbed
//
//  Created by Kiyoma Algama on 12/22/23.
//
//

//Button("Dismiss Modal") {
//dismiss()
//}


//NOTES: Only note is that they have to click for the resume button to come up, and the test button does not dissappear. 
import SwiftUI


var popUpShouldBe = 0
//These are like on-off switches to show the correct button
var presentPopUpRewardMulti = true
var presentPopUpRewardEvenOdd = true
var presentPopUpRewardSub = true
var presentPopUpRewardCounting = true
var presentPopUpRewardAdd = true
var presentPopUpRewardTrueFalse = true
var presentPopUpRewardWordProblems = true

var opacityForResume = true //this will set the color to invisible.

struct FullScreenModalView: View {
    @State private var presentPopUp = true
    @Environment(\.dismiss) var dismiss


    @State var shouldHide =  false // false makes the button hide
    var body: some View {
        ZStack {
            Color(.black)
            if (modType == 0){
                VStack {
                    //This button is shown only after they have solved x amount of questions correctly.
                    Button("Play PuppyBounce!") {
                        shouldHideShapes = true
                    }
                    .fullScreenCover(isPresented: $presentPopUp, content: ShapesView.init)
                    .font(.system(size: 30))
                    .opacity(0.0)
                    .accessibilityLabel("A button that starts a game called PuppyBounce")
                   // : nil
                    
                    Text("XXX = Explain")
                   // Button("Dismiss") {
                    //  if (scoreAdd == 2){
                    //    dismiss()
                    //     }
                    //     opacityForResume = false
                    //     }
                    //   .opacity(opacityForResume ? 0 : 1)
                }
                
            } else if (modType == 1){
                VStack {
                    Text("Horay for multi")
                    //This button is shown only after they have solved x amount of questions correctly.
                    Button("This is for multi"){
                        //
                    }
                    .fullScreenCover(isPresented: $presentPopUp, content: MultiplicationView.init)
                    .font(.system(size: 30))
                    .opacity(0.0)
                    
                    //Button("Dismiss") {
                    // if (scoreAdd == 2){
                    //   dismiss()
                    //    }
                    //    opacityForResume = false
                    //    }
                    //  .opacity(shouldHide ? 0 : 1)
                }
                
            } else if (modType == 2){
                VStack {
                    Text("Horay for evenOdd")
                    //This button is shown only after they have solved x amount of questions correctly.
                    Button("This is for evenOdd"){
                        //
                    }
                    .fullScreenCover(isPresented: $presentPopUp, content: EvenOddView.init)
                    .opacity(presentPopUpRewardEvenOdd ? 0 : 1)
                    
                    Button("Dismiss") {
                      if (scoreAdd == 2){
                        dismiss()
                         }
                         opacityForResume = false
                        }
                      .opacity(shouldHide ? 0 : 1)
                }
                
            } else if (modType == 3){
                VStack {
                    Text("Horay for sub")
                    //This button is shown only after they have solved x amount of questions correctly.
                    Button("This is for sub"){
                        //
                    }
                    .fullScreenCover(isPresented: $presentPopUp, content: SubtractionView.init)
                    .opacity(presentPopUpRewardEvenOdd ? 0 : 1)
                    
                    Button("Dismiss") {
                      if (scoreAdd == 2){
                        dismiss()
                         }
                         opacityForResume = false
                        }
                      .opacity(shouldHide ? 0 : 1)
                }

                
            } else if (modType == 4){
                VStack {
                    Text("Horay for counting")
                    //This button is shown only after they have solved x amount of questions correctly.
                    Button("This is for sub"){
                        //
                    }
                    .fullScreenCover(isPresented: $presentPopUp, content: CountingView.init)
                    .opacity(presentPopUpRewardEvenOdd ? 0 : 1)
                    
                    Button("Dismiss") {
                      if (scoreAdd == 2){
                        dismiss()
                         }
                         opacityForResume = false
                        }
                      .opacity(shouldHide ? 0 : 1)
                }
                
            } else if (modType == 5){
                VStack {
                    
                    Text("Horay for addition")
                    //This button is shown only after they have solved x amount of questions correctly.
                    Button("This is for addition"){
                        //Do Nothing
                    }
                    .fullScreenCover(isPresented: $presentPopUp, content: AdditionView.init)
                    .opacity(presentPopUpRewardAdd ? 0 : 1)
                    
                    Button("Dismiss") {
                      if (scoreAdd >= 2){
                        dismiss()
                         }
                         opacityForResume = false
                        }
                      .opacity(shouldHide ? 0 : 1)
                }
                
            } else if (modType == 6){
                VStack {
                    Text("Horay for truefalseView")
                    //This button is shown only after they have solved x amount of questions correctly.
                    Button("This is for truefalse"){
                        //Do Nothing
                    }
                    .fullScreenCover(isPresented: $presentPopUp, content: TrueFalseView.init)
                    .opacity(presentPopUpRewardAdd ? 0 : 1)
                    
                    Button("Dismiss") {
                      if (scoreAdd >= 2){
                        dismiss()
                         }
                         opacityForResume = false
                        }
                      .opacity(shouldHide ? 0 : 1)
                }
                
                
            } else if (modType == 7){
                VStack {
                    //This button is shown only after they have solved x amount of questions correctly.
                    Button("This is for truefalse"){
                        //Do Nothing
                    }
                    .fullScreenCover(isPresented: $presentPopUp, content: TrueFalseView.init)
                    .opacity(presentPopUpRewardAdd ? 0 : 1)
                    
                    Button("Dismiss") {
                        if (scoreAdd >= 2){
                            dismiss()
                        }
                        opacityForResume = false
                    }
                    .opacity(shouldHide ? 0 : 1)
                } 
            }
            else {
                Text("no it didn't work")
            }
        //Pause game
        //Dismiss Button ONly comes once they have answered 2 questions correctly - this works!!!
        Button("Return to Game") {
                dismiss()
       }
        .frame(width: 150, height: 100)
        .font(.system(size: 19))
        .foregroundColor(.white)
        .fontWeight(.heavy)
        .background(.purple)
        .cornerRadius(10)
       }
        .ignoresSafeArea()
       // Pull data from addition view to see how many they got correct i.e. get score - do 2 questions
        //Exit once done
    }
} //End of struct fullscreenmodalview



var globalGameScore = 0

struct puppyView: View {
    
    @State private var heliPosition = CGPoint(x:120, y:300)
    
    @State private var obstPosition = CGPoint(x:1000, y:300)
    
    @State private var isPaused = false
    
    @State private var gameScore = 0
    
    @State private var timesPaused = 0
    
    @State private var screenTextOffScreen = ""
    
    @State private var restartOResume = "Resume"
    
    @State private var resumeGame = true
    
    @State private var lives = 5 //change later
    
    @State private var showResume = false //this will set opacity to true once the student completes other parts of the popupview
    
    @State var timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    
    //This is for addition problems
    @State private var numOne = 0
    
    @State private var numTwo = 0
    
    @State private var answer = 0
    
    @State private var userInput = 0
    
    @State var presentPopUp = false
    //Test variables
    
    var body: some View {
        //This area will have the settings for the game
        // @State private var heli
        
        GeometryReader { geo in
            
            
            ZStack {
                //Have 7 obstacles at a time
                Obstacle()
                    .position(self.obstPosition)
                    .onReceive(self.timer){_ in
                        self.obstMove()
                    }
                
                Obstacle()
                    .position(self.obstPosition)
                    .onReceive(self.timer){_ in
                        self.obstMove()
                        collisionDetection()
                    }

                Obstacle()
                    .position(self.obstPosition)
                    .onReceive(self.timer){_ in
                        self.obstMove()
                        collisionDetection()
                    }
                
                Obstacle()
                    .position(self.obstPosition)
                    .onReceive(self.timer){_ in
                        self.obstMove()
                        collisionDetection()
                    }
                
                Obstacle()
                    .position(self.obstPosition)
                    .onReceive(self.timer){_ in
                        self.obstMove()
                        collisionDetection()
                    }
                
                Obstacle()
                    .position(self.obstPosition)
                    .onReceive(self.timer){_ in
                        self.obstMove()
                        collisionDetection()
                    }
                
                Obstacle()
                    .position(self.obstPosition)
                    .onReceive(self.timer){_ in
                        self.obstMove()
                        collisionDetection()
                    }
                
                //Resume buttons
                VStack {
                    self.isPaused ? Button("\(restartOResume)") {
                        if (scoreAdd >= 1){
                            lives -= 1
                            resume()
                            opacityForResume = false
                        }
                    }
                    .opacity(opacityForResume ? 0 : 1)
                    .font(.system(size: 50))
                    : nil
                    
                    
                    self.isPaused ? Button("Test to Resume!") {
                        opacityForResume = false
                        scoreAdd = 0
                        pause()
                        presentPopUp.toggle()
                    }
                    .fullScreenCover(isPresented: $presentPopUp, content: FullScreenModalView.init)
                    .font(.system(size: 30))
                    : nil
                }
                 
                
        
                Text("\(screenTextOffScreen)")
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .position(x: geo.size.width - 200, y: geo.size.height / 15 )
                
                Text("Score: \(self.gameScore)")
                    .foregroundColor(.white)
                    .position(x: geo.size.width - 200, y: geo.size.height / 9 )
                    .font(.system(size: 50))
                
                Text("Lives: \(self.lives)")
                    .foregroundColor(.white)
                    .position(x: geo.size.width - 200, y: geo.size.height / 6 )
                    .font(.system(size: 50))
                
                
                PuppyHeli()
                    .position(self.heliPosition)
                    .onReceive(timer) {_ in
                        self.gravity()
                        if self.heliPosition.y > 1100 {
                           resume()
                           screenTextOffScreen = "The puppy went off the screen!"
                        }
                        
                        else if self.heliPosition.y < 100 {
                            screenTextOffScreen = "The puppy went off the screen!"
                            
                        } else {
                            screenTextOffScreen = ""
                        }
                        opacityForResume = true
                        globalGameScore +=  1
                    }
                
                
                //This is where the question is
                
            }
            .frame(width: geo.size.width, height:
                    geo.size.height)
            .background(Color.black)
            .ignoresSafeArea()
            .gesture(
                TapGesture()
                    .onEnded(){
                        withAnimation {
                            self.heliPosition.y -= 150
                        }
                    })
            .onReceive(self.timer) {_ in self.collisionDetection(); self.gameScore += 1}
        }
        .ignoresSafeArea(.all)
     //   .popover(isPresented: $presentPopUp) { // 3
                  // 4
      //                AdditionView()
                   
       //        }
    }
    
        
        func gravity() {
            withAnimation{
                self.heliPosition.y += 30
            }
        }
            
            func obstMove() {
                if self.obstPosition.x > 0 {
                    withAnimation {
                        self.obstPosition.x -= 20 //This makes the green bars faster
                    }
                } else {
                    self.obstPosition.x = 1000
                    self.obstPosition.y = CGFloat.random(in: 0...1000) //This changes the position
                }
            }
            
            func pause() {
                self.timer.upstream.connect().cancel()
                scoreAdd = 0
            }
            
    func resume() {
        if (scoreAdd >= 1) {
            self.timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
            
            self.obstPosition.x = 1000
            self.heliPosition = CGPoint(x:120, y:100)
            
            self.isPaused = false
            presentPopUp = false
            timesPaused += 1
        }
        
        //Should put new struct here.
        if (lives > 0) {
            restartOResume = "Resume"
        } else {
            lives = 5
        }
        
        if (self.timesPaused % 5 == 0) {
            if (timesPaused / 5 == 0) {
                print("Never mind this")
            } else {
                screenTextOffScreen = "Oh no, start again"
                resume()
            }
        }
    }
    
        func collisionDetection() {
            if ((abs(heliPosition.x - obstPosition.x)) < (15 + 10) && ((abs(heliPosition.y - obstPosition.y)) < (15 + 100))) {
                self.pause()
                self.isPaused = true
            }
            //ADD Question and Scorring HERE!!!!
            }
        }//END OF CONTENT VIEW
        
        
#Preview {
    ContentView()
        .previewLayout(.fixed(width: 950, height: 420))
}
