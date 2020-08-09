//
//  ContentView.swift
//  courselistapp
//
//  Created by Sean Kang on 8/8/20.
//

import SwiftUI

struct ContentView: View {
    @State var posts: [Post] = []
    var body: some View {
        List(posts) { post in
            Text(post.title)
                
            }.onAppear {
                Api().getPosts { (posts) in
                    self.posts = posts
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
