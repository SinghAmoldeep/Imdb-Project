//
//  Network.swift
//  imdb
//
//  Created by student on 26/07/24.
//

import Foundation

class Network {
    
    static let network = Network()
    
    private init() {
        
    }
    
    func getAPI(param: [String:Any], completionHandler: @escaping (Data) -> Void) {
        var components = URLComponents(string: "https://api.tvmaze.com/search/shows")
        if !param.isEmpty {
            components?.queryItems = [URLQueryItem]()
            for (key, value) in param {
                let queryItem = URLQueryItem(name: key, value: "\(value)")
                components?.queryItems!.append(queryItem)
            }
        }
        guard let urlString = components?.url else {
            return
        }
        var request = URLRequest(url: urlString)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Error while fetching data:", error)
                return
            }
            
            guard let data = data else {
                return
            }
            print(data)
            completionHandler(data)
        }
        task.resume()
    }
    
    //parse for a list not usually used
    func parse<T:Decodable>(json: Data) -> [T] {
        let decoder = JSONDecoder()
        let jsonResponse = (try? decoder.decode([T].self, from: json)) ?? []
        
        return jsonResponse
    }
    
}
