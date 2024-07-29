//
//  ProfileView.swift
//  imdb
//
//  Created by student on 26/07/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    init() {
        _viewModel = StateObject(wrappedValue: ProfileViewModel())
    }
    var body: some View {
        Button(action: {
            viewModel.logout()
        }, label: {
            Text("Log Out")
        })
    }
}

#Preview {
    ProfileView()
}
