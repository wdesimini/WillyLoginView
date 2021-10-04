//
//  WLY+ButtonStyle.swift
//  WillyLoginView
//
//  Created by Wilson Desimini on 10/4/21.
//

import SwiftUI

struct ButtonStyleWLYBorderedSelectable: ButtonStyle {
    let selected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(selected ? Color.blue : Color.clear)
            .border(Color.black, width: 1)
            .cornerRadius(4)
            .opacity(selected ? 1 : 0.2)
            .padding()
    }
}

struct ButtonStyleWLYProminent: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(4)
    }
}

struct ButtonStyleWLYUnderlinedSelectable: ButtonStyle {
    let selected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
                .padding()
                .font(selected ? .headline : .body)
                .opacity(selected ? 1 : 0.5)
                .foregroundColor(.black)
            if selected {
                VStack {
                    Spacer()
                    Rectangle()
                        .fill(Color.blue)
                        .frame(height: 4)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .frame(height: 52)
    }
}
