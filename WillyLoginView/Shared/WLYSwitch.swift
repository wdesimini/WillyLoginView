//
//  WLYSwitch.swift
//  WillyLoginView
//
//  Created by Wilson Desimini on 9/30/21.
//

import SwiftUI

struct WLYSwitch: View {
    let leftTitle: String
    @Binding var right: Bool
    let rightTitle: String
    
    var body: some View {
        HStack {
            Button(leftTitle) { right = false }
                .buttonStyle(WLYSwitchButtonStyle(selected: !right))
            Button(rightTitle) { right = true }
                .buttonStyle(WLYSwitchButtonStyle(selected: right))
        }
    }
}

private struct WLYSwitchButtonStyle: ButtonStyle {
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

struct WLYSwitch_Previews: PreviewProvider {
    @State static var showingLogin = true
    
    static var previews: some View {
        WLYSwitch(
            leftTitle: "Sign up",
            right: $showingLogin,
            rightTitle: "Log in"
        )
    }
}
