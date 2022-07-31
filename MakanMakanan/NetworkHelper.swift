//
//  NetworkHelper.swift
//  MakanMakanan
//
//  Created by Patrick Sinaga on 29/07/22.
//

import Foundation

struct NetworkHelper {
    
    func parse(complete: @escaping ([DataFood]) -> Void) {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in
            
            guard let safeData = data else {return}
            do {
                let result = try JSONDecoder().decode(Food.self, from: safeData)
                DispatchQueue.main.async {
                    complete(result.categories)
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
