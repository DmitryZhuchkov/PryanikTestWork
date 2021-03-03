//
//  JSONLoad.swift
//  pryanikiTestWork
//
//  Created by Дмитрий Жучков on 11.02.2021.
//

import Foundation
class JSONLoad {
    static let service = JSONLoad()
    func getData(completed: @escaping (JSONDecode?)->()) {
        let session = URLSession.shared
        let url = URL(string: "https://pryaniky.com/static/json/sample.json")
        session.dataTask(with: url! ) { (data, response, error) in
                    if let data = data {
                        do {
                            let json = try JSONDecoder().decode(JSONDecode.self, from: data)
                            completed(json)
                        } catch {
                            print(error.localizedDescription)
                    }
            if error != nil {
                           print(error!.localizedDescription)
                           
                       }
        }
        }.resume()
}
}
