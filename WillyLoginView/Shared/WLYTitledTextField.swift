//
//  WLYTitledTextField.swift
//  WillyLoginView
//
//  Created by Wilson Desimini on 9/30/21.
//

import SwiftUI

struct WLYDetailButtonModel {
    let title: String
    let action: () -> Void
}

struct WLYTitledTextField: View {
    let detailButtonModel: WLYDetailButtonModel?
    let placeholder: String
    let title: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                if let detailButtonModel = detailButtonModel {
                    Spacer()
                    Button(
                        detailButtonModel.title,
                        action: detailButtonModel.action
                    )
                }
            }
            TextField(placeholder, text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct WLYTitledTextField_Previews: PreviewProvider {
    @State static var password = ""
    
    static var previews: some View {
        let detailButtonModel = WLYDetailButtonModel(title: "Forgot Password?") {}
        return WLYTitledTextField(
            detailButtonModel: detailButtonModel,
            placeholder: "Password",
            title: "Password",
            text: $password
        )
    }
}
