//
//  HomeView.swift
//  imdb
//
//  Created by student on 26/07/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel : HomeViewModel
    @State var searchText : String = " "
    @State var goToDetails = false
    @State var selectedItem  = DataList(score: 0.0, show: Show(name: "", type: " ", language: " ", genres: [], image: Img(original: ""), summary: ""))
    
    init() {
        _viewModel = StateObject(wrappedValue: HomeViewModel())
    }
    var body: some View {
        NavigationStack {
            VStack{
                VStack(alignment: .leading) {
                    HStack{
                        Image(systemName: "magnifyingglass")
                        TextField("Search...", text: $searchText)
                        Button(action: {
                            viewModel.getData(searchString:searchText)
                        }, label: {
                            Text("Search")
                        })
                    }
                    .textFieldStyle(DefaultTextFieldStyle())
                }.padding()
                ScrollView{
                    if viewModel.allData.isEmpty{
                        Text("No Data Available")
                            .font(.title)
                    } else {
                        ForEach(viewModel.allData, id : \.score) {
                            item in Button(action : {
                                goToDetails = true
                                selectedItem = item
                            } , label : {
                                HomeCardView(item : item)
                                    .padding()
                            })
                        }
                    }
                }
            }
            .navigationDestination(isPresented: $goToDetails){
                ShowDetailView(item : selectedItem)
            }
            .toolbarBackground(Color.yellow, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}
