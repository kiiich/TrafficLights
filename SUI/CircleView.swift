//
//  CircleView.swift
//  SUI
//
//  Created by Николай on 27.10.2021.
//

import SwiftUI

struct CircleView: View {
    
    let color: Color
    var opacity: Double
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: 100, height: 100, alignment: .center)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.black, lineWidth: 4))
            .opacity(opacity)
        
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(color: .red, opacity: 1)
    }
}
