//
//  Singleton.swift
//  imdb
//
//  Created by student on 26/07/24.
//

import Foundation

class Shared {
    static let shared = Shared()
    
    private init() {
        
    }
    
    let defaults = UserDefaults.standard
}

extension String {
    var html2AttributedString: String? {
        guard let data = data(using: .utf8) else { return nil}
        do {
            return try NSAttributedString(data : data , options: [.documentType : NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue],documentAttributes: nil).string
        } catch let error as NSError {
            print(error.localizedDescription)
            return nil
        }
    }
}
