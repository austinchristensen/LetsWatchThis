//
//  DataBaseJSONParser.swift
//  LetsWatchThis
//
//  Created by Austin Christensen on 4/26/21.
//

import Foundation

class DataBaseJSONParser {
    
    func parseJSON(data: Data) -> [MediaItem] {
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                guard json.count > 0 else { return [] }
                if let type = json[0]["media_type"] as? String {
                    switch type.trimmingCharacters(in: .whitespacesAndNewlines) {
                    case "movie":
                        return parseMovies(jsonData: json)
                    case "show":
                        return parseShows(jsonData: json)
                    case "book":
                        return parseBooks(jsonData: json)
                    default:
                        return []
                    }
                } else {
                    print("Couldn't get the media type")
                }
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }
        
        return []
    }
    
    private func parseMovies(jsonData: [[String: Any]]) -> [MediaItem] {
        print("Parsing Movies")
        var parsedItems: [MediaItem] = []
        jsonData.forEach({ mediaItem in
            if let title = mediaItem["movie_title"] as? String,
               let id = mediaItem["movie_id"] as? Int,
               let description = mediaItem["movie_description"] as? String,
               let isCompleted = mediaItem["iscompleted"] as? Bool,
               let type = mediaItem["media_type"] as? String,
               let imagePath = mediaItem["image_path"] as? String {
                let item = MediaItem(title: title, mediaID: id, id: UUID(), isCompleted: isCompleted, description: description, type: MediaType(rawValue: type.trimmingCharacters(in: .whitespacesAndNewlines)) ?? .movie, imagePath: imagePath)
                parsedItems.append(item)
            } else if let title = mediaItem["movie_title"] as? String,
                      let id = mediaItem["movie_id"] as? Int,
                      let description = mediaItem["movie_description"] as? String,
                      let type = mediaItem["media_type"] as? String,
                      let imagePath = mediaItem["image_path"] as? String {
                let item = MediaItem(title: title, mediaID: id, id: UUID(), isCompleted: false, description: description, type: MediaType(rawValue: type.trimmingCharacters(in: .whitespacesAndNewlines)) ?? .movie, imagePath: imagePath)
                parsedItems.append(item)
            } else {
                print("Couldn't properly parse movie")
            }
        })
        return parsedItems
    }
    
    private func parseShows(jsonData: [[String: Any]]) -> [MediaItem] {
        print("Parsing Shows")
        var parsedItems: [MediaItem] = []
        jsonData.forEach({ mediaItem in
            if let title = mediaItem["show_title"] as? String,
               let id = mediaItem["show_id"] as? Int,
               let description = mediaItem["show_description"] as? String,
               let type = mediaItem["media_type"] as? String,
               let isCompleted = mediaItem["iscompleted"] as? Bool,
               let imagePath = mediaItem["image_path"] as? String {
                let item = MediaItem(title: title, mediaID: id, id: UUID(), isCompleted: isCompleted, description: description, type: MediaType(rawValue: type.trimmingCharacters(in: .whitespacesAndNewlines)) ?? .show, imagePath: imagePath)
                parsedItems.append(item)
            } else if let title = mediaItem["show_title"] as? String,
                      let id = mediaItem["show_id"] as? Int,
                      let description = mediaItem["show_description"] as? String,
                      let type = mediaItem["media_type"] as? String,
                      let imagePath = mediaItem["image_path"] as? String {
                let item = MediaItem(title: title, mediaID: id, id: UUID(), isCompleted: false, description: description, type: MediaType(rawValue: type.trimmingCharacters(in: .whitespacesAndNewlines)) ?? .show, imagePath: imagePath)
                parsedItems.append(item)
            } else {
                print("Couldn't properly parse show")
            }
        })
        return parsedItems
    }
    
    private func parseBooks(jsonData: [[String: Any]]) -> [MediaItem] {
        print("Parsing Books")
        var parsedItems: [MediaItem] = []
        jsonData.forEach({ mediaItem in
            if let title = mediaItem["book_title"] as? String,
               let id = mediaItem["book_id"] as? Int,
               let description = mediaItem["book_description"] as? String,
               let type = mediaItem["media_type"] as? String,
               let isCompleted = mediaItem["iscompleted"] as? Bool,
               let imagePath = mediaItem["image_path"] as? String {
                let item = MediaItem(title: title, mediaID: id, id: UUID(), isCompleted: isCompleted, description: description, type: MediaType(rawValue: type.trimmingCharacters(in: .whitespacesAndNewlines)) ?? .book, imagePath: imagePath)
                parsedItems.append(item)
            } else if let title = mediaItem["book_title"] as? String,
                      let id = mediaItem["book_id"] as? Int,
                      let description = mediaItem["book_description"] as? String,
                      let type = mediaItem["media_type"] as? String,
                      let imagePath = mediaItem["image_path"] as? String {
                let item = MediaItem(title: title, mediaID: id, id: UUID(), isCompleted: false, description: description, type: MediaType(rawValue: type.trimmingCharacters(in: .whitespacesAndNewlines)) ?? .book, imagePath: imagePath)
                parsedItems.append(item)
            } else {
                print("Couldn't properly parse book")
            }
        })
        return parsedItems
    }
}
