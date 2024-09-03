//
//  ClockView.swift
//  AngularGradientClock
//
//  Created by XIN QI on 2024/9/3.
//

import SwiftUI

struct ClockView: View {
    
    @State private var rotationAngle: Double = 0
    private let _screenWidth = UIScreen.main.bounds.size.width
    private let _screenHeight = UIScreen.main.bounds.size.height
    private let _rotationDuration = 3.0
    
    var body: some View {
        ZStack() {
            AngularGradient(gradient: Gradient(colors: [Color.black, Color.white]), center:.center, angle: .degrees(rotationAngle))
                .ignoresSafeArea()
            
            VStack() {
                Text("DAY")
                    .font(.system(size: 40, weight:.bold, design:.monospaced))
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0 ))
                
                Spacer()
                
                Text("NIGHT")
                    .font(.system(size: 40, weight:.bold, design:.monospaced))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0 ))
            }
        }
        .onAppear {
            withAnimation(.linear(duration: _rotationDuration).repeatForever(autoreverses: false)) {
                rotationAngle += 360
            }
        }
    }
}

#Preview {
    ClockView()
}
