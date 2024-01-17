//
//  speechToText.swift
//  testCaseNeuroMathBuddies
//
//  Created by Kiyoma Algama on 12/28/23.
//

import SwiftUI
import AVFoundation

struct speechToTextView: View {
    @State  var number = 0
    @State  var name : String = ""
    
    let synthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            Button ("Speak"){
                let utterance = AVSpeechUtterance(string: "Hallo, my name is")
                utterance.rate = 0.2
                utterance.pitchMultiplier = 0.8
                utterance.postUtteranceDelay = 0.2
                utterance.volume = 0.8
                
                let voice = AVSpeechSynthesisVoice(language: "en-US")
                
                utterance.voice = voice
                
                synthesizer.speak(utterance)
            }
        }
    }
}
    
    
    
    struct speechToTextView_Previews: PreviewProvider {
        static var previews: some View {
            speechToTextView()
        }
    }
    

