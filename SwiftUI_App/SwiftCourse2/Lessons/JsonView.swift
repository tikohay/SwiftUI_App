//
//  JsonView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 19.04.2022.
//

import SwiftUI

struct JsonView: View {
    
    @State var posts: [Post] = [] {
        didSet {
            print(posts.first?.title)
        }
    }
    
    var body: some View {
        NavigationView {
            List(posts) { post in
                VStack {
                    Text(post.title ?? "hello")
                    Text(post.body ?? "")
                }
            }
            .onAppear {
                Api.getPost { result in
                    switch result {
                    case let .success(posts):
                        self.posts = posts
                    case let .failure(error):
                        print(error)
                    }
                }
            }
        }
    }
}

struct Post: Codable, Identifiable {
    let id = UUID()
    var title: String
    var body: String
}

class Api {
    static func getPost(completion: @escaping (Result<[Post], Error>) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            do {
                let posts = try? JSONDecoder().decode([Post].self, from: data!)
                DispatchQueue.main.async {
                    completion(.success(posts!))
                }
            } catch {
                print(error)
            }
            
        }.resume()
    }
}
