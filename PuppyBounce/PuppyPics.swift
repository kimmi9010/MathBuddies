//
//  PuppyPics.swift
//  flappyPuppyEmbed
//
//  Created by Kiyoma Algama on 12/23/23.
//

import SwiftUI



struct Pixel: View {
    let size: CGFloat
    let color: Color
    
    var body: some View {
       Rectangle()
            .frame(width: size, height: size)
            .foregroundColor(.blue)
    }
}
