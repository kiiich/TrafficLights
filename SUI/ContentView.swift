//
//  ContentView.swift
//  SUI
//
//  Created by Николай on 26.10.2021.
//

import SwiftUI

struct ContentView: View {
   
    @State private var tapCount = 0
    @State private var buttonTitle = "Start"
    @State private var redLight = CircleView(color: .red, opacity: 1)
    @State private var yellowLight = CircleView(color: .yellow, opacity: 1)
    @State private var greenLight = CircleView(color: .green, opacity: 1)
    
    var body: some View {
        VStack() {
            trafficLights
            Spacer()
            lightSwitcher
        }.padding(.top, 40)
    }

    private var trafficLights: some View {
        VStack(spacing: 20.0) {
            redLight
            yellowLight
            greenLight
            
        }
    }
    
    private var lightSwitcher: some View {
        Button(action: {
            if tapCount == 0 {
                buttonTitle = "Next"
            } else if tapCount == 3 {
                tapCount = 0
            }
            tapCount += 1
            changeLight()
        }) {
            Text("\(buttonTitle)")
                .font(.title)
        }
        .padding()
        .background(Color.green)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .offset(x: 0, y: -80)
    }
    
    private func changeLight() {
        
        let secondaryLightOpacity = 0.3
    
        redLight.opacity = tapCount == 1 ? 1 : secondaryLightOpacity
        yellowLight.opacity = tapCount == 2 ? 1 : secondaryLightOpacity
        greenLight.opacity = tapCount == 3 ? 1 : secondaryLightOpacity
        
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
