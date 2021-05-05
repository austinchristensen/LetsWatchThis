//
//  DetailView.swift
//  LetsWatchThis
//
//  Created by Austin Christensen on 4/6/21.
//

import SwiftUI

struct ItemDetailView: View {
    @State var hasWatched: Bool = true
    let item: MediaItem
    
    var body: some View {
        ScrollView(.vertical) {
            VStack() {
                Text(item.title)
                    .font(.largeTitle)
                Image("\(item.imagePath)")
                    .resizable()
                    .frame(height: 450)
                Text(item.description)
                Divider()
                HStack(spacing: 50) {
                    VStack() {
                        Text("Have you watched this?")
                        Toggle("Watched?", isOn: $hasWatched).labelsHidden()
                    }
                    Button("Delete") {
                        print("Delete Button Pressed")
                    }
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: MediaItem(title: "School of Rock", mediaID: 1, id: UUID(), isCompleted: true, description: "Wanna be rock star Dewey needs to pay the rent or he's out on the streets. After getting kicked out of his band he's desparate to find work. When a takes a call meant for his friend Ned, he hatches a clever plan", type: .movie))
    }
}
