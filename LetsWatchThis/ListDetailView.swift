//
//  CategoryDetailView.swift
//  LetsWatchThis
//
//  Created by Austin Christensen on 4/6/21.
//

import SwiftUI

struct ListDetailView: View {
    let items: [MediaItem]
    let title: String
    
    let columns = [
        GridItem(.adaptive(minimum: 100), spacing: 10)
    ]
    
    var body: some View {
        ScrollView() {
            Text("Need to Watch")
                .font(.largeTitle)
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(items, id: \.id) { item in
                    if (!item.isCompleted) {
                        NavigationLink(destination: ItemDetailView(item: item)) {
                            VStack() {
                                Image("\(item.imagePath)")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(25)
                                Text(item.title)
                            }
                        }
                    }
                }
            }
            Text("Already Watched")
                .font(.largeTitle)
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(items, id: \.id) { item in
                    if (item.isCompleted) {
                        NavigationLink(destination: ItemDetailView(item: item)) {
                            VStack() {
                                Image("\(item.imagePath)")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(25)
                                Text(item.title)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle(title)
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(items: [
            MediaItem(title: "Movie 1", id: UUID(), isCompleted: true, description: "Description for Movie 1", type: .movie),
            MediaItem(title: "Movie 2", id: UUID(), isCompleted: false, description: "Description for Movie 2", type: .movie),
            MediaItem(title: "Movie 3", id: UUID(), isCompleted: true, description: "Description for Movie 3", type: .movie),
            MediaItem(title: "Movie 4", id: UUID(), isCompleted: false, description: "Description for Movie 4", type: .movie),
            MediaItem(title: "Movie 5", id: UUID(), isCompleted: true, description: "Description for Movie 5", type: .movie)
        ], title: "My Movies:")
    }
}
