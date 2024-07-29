//
//  PasswordSecureFieldView.swift
//  imdb
//
//  Created by student on 24/07/24.
//

import SwiftUI

struct PasswordSecureFieldView: View {
    @Binding var password: String
    @State var showPassword: Bool = false
    
    var body: some View {
        HStack{
            Group{
                if showPassword {
                    TextField("", text: $password, prompt: Text("Password").foregroundColor(.gray))
                } else {
                    SecureField("", text: $password, prompt: Text("Password").foregroundColor(.gray))
                }
            }
            .disableAutocorrection(true)
            .autocapitalization(.none)
            Button(action: {
                self.showPassword.toggle()
            }, label: {
                Image(systemName: self.showPassword ? "eye.slash.fill" : "eye.fill")
            })
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10.0)
            .fill(Color("ThemeGray"))
            .strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
        .foregroundColor(Color("FontColor"))
    }
}

#Preview {
    PasswordSecureFieldView(password: .constant(""))
}
