//
//  Data.swift
//  courselistapp
//
//  Created by Sean Kang on 8/8/20.
//

import Foundation


struct Post: Codable, Identifiable {
    let id = UUID()
    var title: String
    var body: String
}


class Api {
    func getPosts(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let pokemonList = try! JSONDecoder().decode([Post].self, from: data!)
            print(pokemonList)
            DispatchQueue.main.async {
                completion(pokemonList)
            }
           
        }.resume()
    }
}
