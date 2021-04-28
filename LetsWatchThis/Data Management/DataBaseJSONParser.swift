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
            // make sure this JSON is in the format we expect
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                // try to read out a string array
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
        var parsedItems: [MediaItem] = []
        jsonData.forEach({ mediaItem in
            //            let id = mediaItem["movie_id"] as? String,
            if let title = mediaItem["movie_title"] as? String,
               let description = mediaItem["movie_description"] as? String,
               let type = mediaItem["media_type"] as? String,
               let imagePath = mediaItem["image_path"] as? String {
                let item = MediaItem(title: title, id: UUID(), isCompleted: false, description: description, type: MediaType(rawValue: type.trimmingCharacters(in: .whitespacesAndNewlines)) ?? .movie, imagePath: imagePath)
                parsedItems.append(item)
            } else {
                print("Couldn't properly parse this stuff")
            }
        })
        return parsedItems
    }
    
    private func parseShows(jsonData: [[String: Any]]) -> [MediaItem] {
        var parsedItems: [MediaItem] = []
        jsonData.forEach({ mediaItem in
            //            let id = mediaItem["movie_id"] as? String,
            if let title = mediaItem["show_title"] as? String,
               let description = mediaItem["show_description"] as? String,
               let type = mediaItem["media_type"] as? String,
               let imagePath = mediaItem["image_path"] as? String {
                let item = MediaItem(title: title, id: UUID(), isCompleted: false, description: description, type: MediaType(rawValue: type.trimmingCharacters(in: .whitespacesAndNewlines)) ?? .show, imagePath: imagePath)
                parsedItems.append(item)
            }
        })
        return parsedItems
    }
    
    private func parseBooks(jsonData: [[String: Any]]) -> [MediaItem] {
        var parsedItems: [MediaItem] = []
        jsonData.forEach({ mediaItem in
            //            let id = mediaItem["movie_id"] as? String,
            if let title = mediaItem["book_title"] as? String,
               let description = mediaItem["book_description"] as? String,
               let type = mediaItem["media_type"] as? String,
               let imagePath = mediaItem["image_path"] as? String {
                let item = MediaItem(title: title, id: UUID(), isCompleted: false, description: description, type: MediaType(rawValue: type.trimmingCharacters(in: .whitespacesAndNewlines)) ?? .book, imagePath: imagePath)
                parsedItems.append(item)
            }
        })
        return parsedItems
    }
}
