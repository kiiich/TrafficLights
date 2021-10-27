//
//  ContentView.swift
//  SUI
//
//  Created by Николай on 26.10.2021.
//

import SwiftUI

struct ContentView: View {
   
    @State private var tapCount = 0
    @State private var buttonTitle = "START"
    @State private var lights = [
        CircleView(color: .red, opacity: 1),
        CircleView(color: .yellow, opacity: 1),
        CircleView(color: .green, opacity: 1)
    ]
    
    var body: some View {
        ZStack() {
            Color.black
                .ignoresSafeArea()
            VStack(){
                trafficLights
                Spacer()
                lightSwitcher
            }
            .padding(.top, 40)
        }
    }

    private var trafficLights: some View {
        VStack(spacing: 20.0) {
            lights[0]
            lights[1]
            lights[2]
        }
    }
    
    private var lightSwitcher: some View {
        Button(action: {
            if tapCount == 0 {
                buttonTitle = "NEXT"
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
        .frame(width: 170, height: 60, alignment: .center)
        .background(Color.blue)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(.white, lineWidth: 4))
        .offset(x: 0, y: -60)
    }
    
    private func changeLight() {
        for index in (0...lights.count - 1) {
            lights[index].opacity = tapCount == index + 1 ? 1 : 0.3
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
