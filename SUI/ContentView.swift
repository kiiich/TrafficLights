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
    
    var body: some View {
        VStack() {
            trafficLights
            Spacer()
            lightSwitcher
        }.padding(.top, 40)
    }

    private var trafficLights: some View {
        VStack(spacing: 20.0) {
            CircleView(color: .red, opacity: 1)
            CircleView(color: .yellow, opacity: 1)
            CircleView(color: .green, opacity: 1)
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

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
