//
//  WLYCheckbox.swift
//  WillyLoginView
//
//  Created by Wilson Desimini on 10/1/21.
//

import SwiftUI

struct WLYCheckbox: View {
    @Binding var checked: Bool
    let text: String
    
    var body: some View {
        HStack {
            Button("     ") { checked = !checked }
                .buttonStyle(WLYCheckboxButtonStyle(selected: checked))
            Text(text)
                .textStyle(WLYFootnoteTextStyle())
        }
    }
}

struct WLYCheckboxButtonStyle: ButtonStyle {
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

struct WLYCheckbox_Previews: PreviewProvider {
    @State static var checked = false
    
    static var previews: some View {
        WLYCheckbox(
            checked: $checked,
            text: "By creating an account, you agree to the terms of service and our privacy policy"
        )
        .previewLayout(
            .fixed(width: 400, height: 52)
        )
    }
}
