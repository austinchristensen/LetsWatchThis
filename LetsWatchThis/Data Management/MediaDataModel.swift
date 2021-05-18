//
//  MediaDataModel.swift
//  LetsWatchThis
//
//  Created by Austin Christensen on 4/7/21.
//

import Foundation

enum MediaType: String, Codable {
    case movie
    case show
    case book
}

struct MediaItem : Codable, Equatable {
    var title: String
    var mediaID: Int
    var id: UUID
    var isCompleted: Bool = false
    var description: String
    var type: MediaType
    var imagePath: String = "imagePlaceholder"
}
