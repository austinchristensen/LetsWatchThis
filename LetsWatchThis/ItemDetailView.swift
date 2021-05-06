//
//  DetailView.swift
//  LetsWatchThis
//
//  Created by Austin Christensen on 4/6/21.
//

import SwiftUI

struct ItemDetailView: View {
    @Environment(\.presentationMode) var presentation
    @State var hasWatched: Bool = true
    let item: MediaItem
    let userID: Int
    let updater: MediaUpdater
    
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
                        let consumptionType = item.type != .book ? "watched" : "read"
                        Text("Have you \(consumptionType) this?")
                        Toggle("\(consumptionType.capitalizingFirstLetter())?", isOn: $hasWatched).labelsHidden()
                    }
                    Button("Delete") {
                        DataManager.removeFromUsersList(userID: userID, mediaItem: item, updater: updater)
                        self.presentation.wrappedValue.dismiss()
                    }
                }
            }
        }
        .onAppear(perform: {
            hasWatched = item.isCompleted
        })
        .onDisappear(perform: {
            if (hasWatched != item.isCompleted) {
                var updatedItem = item
                updatedItem.isCompleted = hasWatched
                DataManager.updateIsCompleted(mediaItem: updatedItem, userID: userID, updater: updater)
            }
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: MediaItem(title: "School of Rock", mediaID: 1, id: UUID(), isCompleted: true, description: "Wanna be rock star Dewey needs to pay the rent or he's out on the streets. After getting kicked out of his band he's desparate to find work. When a takes a call meant for his friend Ned, he hatches a clever plan", type: .movie), userID: 1, updater: MediaUpdater())
    }
}
