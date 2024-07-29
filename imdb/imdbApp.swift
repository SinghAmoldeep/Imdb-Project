//
//  imdbApp.swift
//  imdb
//
//  Created by student on 24/07/24.
//

import SwiftUI

@main
struct imdbApp: App {
    var body: some Scene {
        WindowGroup {
            let isLogin = UserDefaults.standard.bool(forKey: "Login State")
            if isLogin {
                TabBarView()
            } else {
                ContentView()
            }
        }
    }
}
