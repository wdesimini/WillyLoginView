//
//  WLYCheckbox.swift
//  WillyLoginView
//
//  Created by Wilson Desimini on 10/4/21.
//

import SwiftUI

struct WLYCheckbox: View {
    @Binding var checked: Bool
    let text: String
    
    var body: some View {
        HStack {
            Button("     ") { checked = !checked }
                .buttonStyle(ButtonStyleWLYBorderedSelectable(selected: checked))
            Text(text)
                .textStyle(WLYFootnoteTextStyle())
        }
    }
}

struct WLYCheckbox_Previews: PreviewProvider {
    @State static var checked = false
    
    static var previews: some View {
        WLYCheckbox(checked: $checked, text: "Remember this device")
    }
}
