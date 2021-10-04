//
//  WLY+TextFieldStyle.swift
//  WillyLoginView
//
//  Created by Wilson Desimini on 10/4/21.
//

import SwiftUI

struct TextFieldStyleTitled: TextFieldStyle {
    struct AccessoryModel {
        let title: String
        let action: () -> Void
    }
    
    let accessoryModel: AccessoryModel?
    let title: String
    
    init(
        accessoryModel: AccessoryModel? = nil,
        title: String
    ) {
        self.accessoryModel = accessoryModel
        self.title = title
    }
    
    func _body(configuration: TextField<_Label>) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                if let model = accessoryModel {
                    Spacer()
                    Button(model.title, action: model.action)
                }
            }
            configuration
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}
