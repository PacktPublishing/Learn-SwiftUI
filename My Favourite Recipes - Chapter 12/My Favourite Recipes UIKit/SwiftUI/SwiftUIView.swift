//
//  SwiftUIView.swift
//  My Favourite Recipes UIKit
//
//  Created by Chris Barker on 07/02/2020.
//  Copyright © 2020 Packt. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State var mockData = ["Recipe 1", "Recipe 2", "Recipe 3"]
    @State var shouldStrike = true
    
    var body: some View {
        VStack {
            List(mockData, id: \.self) { recipe in
                NavigationLink(destination: SecondSwiftUIView())  {
                    Text(recipe)
                }
            }
            Spacer()
            Button(action: {
                self.mockData = ["Recipe 4", "Recipe 5", "Recipe 6"]
                self.shouldStrike.toggle()
            }) {
                Text("New Data")
                    .padding()
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black, lineWidth: 8)
                    )
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.white, .blue, .green]), startPoint: .top, endPoint: .bottom)
                    )
            }
            Spacer()
            Spacer()
            Text("Strike through me")
                .strikethrough(shouldStrike, color: .red)
        }
    }
    
}

extension Text {
    func strikethrough(_ active: Bool, _ color: Color, _ start: Int, _ length: Int) -> some View {
        self.strikethrough(active, color: color)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

struct SecondSwiftUIView: View {
    var body: some View {
        Text("Second View")
    }
}
