//
//  MediaUpdater.swift
//  LetsWatchThis
//
//  Created by Austin Christensen on 4/27/21.
//

import Foundation

class MediaUpdater: ObservableObject {
    @Published var mediaList: [MediaItem] = []
    @Published var newlyAddedMediaItem: MediaItem?

    public func updateMediaList(newItems: [MediaItem]) {
        newItems.forEach({ item in
            if !mediaList.contains(where: {$0.mediaID == item.mediaID && $0.title == item.title} ) {
                mediaList.append(item)
            }
        })
        print("updateMediaList array count: \(mediaList.count)")
    }
}
