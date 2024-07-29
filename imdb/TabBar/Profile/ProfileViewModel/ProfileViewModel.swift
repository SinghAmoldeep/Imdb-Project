//
//  ProfileViewModel.swift
//  imdb
//
//  Created by student on 26/07/24.
//

import SwiftUI
import Foundation

class ProfileViewModel: ObservableObject {
    func logout() {
        UserDefaults.standard.set(false, forKey: "Login State")
        let window = UIApplication.shared.connectedScenes.flatMap {($0 as? UIWindowScene)?.windows ?? []}.first{$0.isKeyWindow}
        window?.rootViewController = UIHostingController(rootView: LoginView())
        window?.makeKeyAndVisible()
    }
}


