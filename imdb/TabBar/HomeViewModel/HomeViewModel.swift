//
//  HomeViewModel.swift
//  imdb
//
//  Created by student on 26/07/24.
//

import Foundation

class HomeViewModel : ObservableObject {
    @Published var allData : [DataList] = []
    
    func getData(searchString : String){
        Network.network.getAPI(param: ["q":searchString]){ data in
            DispatchQueue.main.async {
                self.allData = Network.network.parse(json: data)
            }
        }
    }
}
