//
//  PuppyObstacles.swift
//  flappyPuppyEmbed
//
//  Created by Kiyoma Algama on 12/23/23.
//

import SwiftUI

struct Obstacle: View {
    let width: CGFloat = 30
    let height: CGFloat = 300
    
    var body: some View {
        Rectangle()
            .frame(width: width, height: height)
            .foregroundColor(Color.green)
    }
}
