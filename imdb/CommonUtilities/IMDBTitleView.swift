//
//  IMDBTitleView.swift
//  imdb
//
//  Created by student on 24/07/24.
//

import SwiftUI

struct IMDBTitleView: View {
    var body: some View {
        GeometryReader(content: { geometry in
            Image("Movies")
                .resizable()
                .frame(width: geometry.size.width, height: geometry.size.width/3, alignment: .center)
        })
    }
}

#Preview {
    IMDBTitleView()
}
