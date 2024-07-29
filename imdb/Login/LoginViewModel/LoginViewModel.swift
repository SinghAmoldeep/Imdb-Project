//
//  LoginViewModel.swift
//  imdb
//
//  Created by student on 24/07/24.
//

import SwiftUI

class LoginViewModel: ObservableObject{
    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = false
    
    func validate()-> Validate {
        let isPW = password.range(of: "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$", options: .regularExpression) != nil
        if self.userName.isEmpty || self.password.isEmpty {
            return Validate(message: "Please enter both details", isValid: false)
        } 
//        else if !isPW {
//            return Validate(message: "Please enter a valid password", isValid: false)
//        } 
        else {
            return Validate(message: "", isValid: true)
        }
    }
    
    func login() {
        UserDefaults.standard.set(true, forKey: "Login State")
        let window = UIApplication.shared.connectedScenes.flatMap{($0 as? UIWindowScene)?.windows ?? []}.first{$0.isKeyWindow}
        window?.rootViewController = UIHostingController(rootView: TabBarView())
        window?.makeKeyAndVisible()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1500.0) {
            UserDefaults.standard.set(false, forKey: "Login State")
            let window = UIApplication.shared.connectedScenes.flatMap {($0 as? UIWindowScene)?.windows ?? []}.first{$0.isKeyWindow}
            window?.rootViewController = UIHostingController(rootView: LoginView())
            window?.makeKeyAndVisible()
        }
    }
}


