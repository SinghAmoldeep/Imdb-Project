//
//  LoginView.swift
//  imdb
//
//  Created by student on 24/07/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    @State private var forgotAlert = false
    @State private var validAlert = false
    @State private var validResponse = Validate(message: "", isValid: false)
    init() {
        _viewModel = StateObject(wrappedValue: LoginViewModel())
    }
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                IMDBTitleView()
                    .frame(width: 300, height: 120)
                
                VStack{
                    CustomTextFieldView(text: $viewModel.userName, placeHolder: "Username")
                    PasswordSecureFieldView(password: $viewModel.password)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            forgotAlert = true
                        }, label: {
                            Text(LoginConstants().forgotPassword)
                        })
                        .alert(LoginConstants().forgotMessage, isPresented: $forgotAlert) {
                            Button(LoginConstants().alertButton, role: .cancel) { }
                        }
                    }
                    
                }.padding(.horizontal)
                Spacer()
                
                SubmitButtonView(isTapped: $viewModel.isLoggedIn, title: LoginConstants().login, action: {
                    self.validResponse = viewModel.validate()
                    if !self.validResponse.isValid {
                        validAlert = true
                    } else {
                        viewModel.login()
                    }
                })
                .alert(validResponse.message, isPresented: $validAlert) {
                    Button(LoginConstants().alertButton, role: .cancel) { }
                }
                .padding(.horizontal)
                
                HStack {
                    Text(LoginConstants().noAccount)
                        .foregroundStyle(Color.gray)
                    Button(action: {
                        
                    }, label: {
                        Text(LoginConstants().signUp)
                    })
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}

