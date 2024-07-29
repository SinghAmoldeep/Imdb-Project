//
//  SubmitButtonView.swift
//  imdb
//
//  Created by student on 24/07/24.
//

import SwiftUI

struct SubmitButtonView: View {
    @Binding var isTapped: Bool
    var title: String = "Submit"
    var action: () -> Void
    var body: some View {
        Button {
            self.action()
        } label: {
            Text(title)
                .font(.title2)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
}

#Preview {
    SubmitButtonView(isTapped: .constant(false), action: {})
}
