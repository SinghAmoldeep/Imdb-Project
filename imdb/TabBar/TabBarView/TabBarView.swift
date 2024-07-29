//
//  TabBarView.swift
//  imdb
//
//  Created by student on 26/07/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Label("", systemImage: "list.dash")
                }
            ProfileView()
                .tabItem {
                    Label("", systemImage: "person.crop.circle.fill")
                }
        }
    }
}

#Preview {
    TabBarView()
}
