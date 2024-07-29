//
//  CustomTextFieldView.swift
//  imdb
//
//  Created by student on 24/07/24.
//

import SwiftUI

struct CustomTextFieldView: View {
    @Binding var text: String
    var placeHolder: String = "Enter your name"
    var body: some View {
        TextField("", text: $text, prompt: Text(placeHolder).foregroundColor(.gray))
            .padding()
            .background(RoundedRectangle(cornerRadius: 10.0)
                .fill(Color("ThemeGray"))
                    .strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                    .foregroundColor(Color("FontColor"))
        
    }
}

#Preview {
    CustomTextFieldView(text: .constant(""))
}
