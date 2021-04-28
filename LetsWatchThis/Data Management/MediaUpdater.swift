//
//  MediaUpdater.swift
//  LetsWatchThis
//
//  Created by Austin Christensen on 4/27/21.
//

import Foundation

class MediaUpdater: ObservableObject {
    @Published var mediaList: [MediaItem] = []
    
    public func updateMediaList(newItems: [MediaItem]) {
        mediaList.append(contentsOf: newItems)
        print("updateMediaList array count: \(mediaList.count)")
    }
}
