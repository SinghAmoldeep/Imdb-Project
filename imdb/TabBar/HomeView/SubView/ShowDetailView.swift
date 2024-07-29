//
//  ShowDetailView.swift
//  imdb
//
//  Created by student on 29/07/24.
//

import SwiftUI

struct ShowDetailView: View {
    var item : DataList
    
    var body: some View {
        VStack {
            Divider()
                .background(Color.black)
            HStack {
                Text(item.show.name ?? "Not available")
                    .font(.largeTitle)
                    .foregroundStyle(Color.black)
                Spacer()
                VStack{
                    if let type = item.show.type {
                        Text(type)
                            .font(.caption)
                            .padding(5)
                            .background(Color(.yellow))
                            .foregroundStyle(Color.black)
                            .clipShape(Capsule())
                    }
                    if let language = item.show.language {
                        Label(language,systemImage: "book.fill")
                            .font(.caption2)
                            .padding(5)
                            .background(Color(.yellow))
                            .foregroundStyle(Color.black)
                            .clipShape(Capsule())
                    }
                }
            }
            ScrollView {
                if let url = URL(string: item.show.image.original ?? " "){
                    AsyncImage(url: url) { phase in
                        if let image = phase.image {
                            image.resizable()
                        } else {
                            Image(systemName: "photo")
                                .font(.title)
                                .foregroundStyle(Color.black)
                        }
                    }
                    .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: 350)
                }
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing : 15){
                        ForEach(item.show.genres ?? [],id: \.self) { genre in
                            GenerView(title:genre)
                        }
                    }
                }
                
                Text(item.show.summary?.html2AttributedString ?? "Not Available")
                    .foregroundStyle(Color.black)
            }
            Divider()
                .background(Color.black)
        }
        .navigationTitle("Details")
        .padding()
        .background(Color("ThemeGray"))
    }
}

struct GenerView : View {
    var title : String = " "
    var body : some View {
        Label(title, systemImage: "boolmark.fill")
            .padding(5)
            .background(Color(.yellow))
            .foregroundStyle(Color.black)
            .clipShape(Capsule())
            
    }
}

