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
            WLYSwitchButton(selected: !right, title: leftTitle) {
                right = false
            }
            WLYSwitchButton(selected: right, title: rightTitle) {
                right = true
            }
        }
    }
}

struct WLYSwitchButton: View {
    var selected: Bool
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            ZStack {
                Text(title)
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
        })
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
