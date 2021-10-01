//
//  WLYTextStyle.swift
//  WillyLoginView
//
//  Created by Wilson Desimini on 10/1/21.
//

import SwiftUI

extension Text {
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}

struct WLYTitleTextStyle: ViewModifier {
    private let font = Font.system(.title).bold()
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .padding(.vertical)
    }
}
