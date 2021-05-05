//
//  DataManager.swift
//  LetsWatchThis
//
//  Created by Austin Christensen on 4/7/21.
//

import Foundation

public class DataManager {
    static func getData(urlString: String, updater: MediaUpdater) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                updater.updateMediaList(newItems: DataBaseJSONParser().parseJSON(data: data))
            }
        }
        
        task.resume()
    }
    
    //POST we want to create the new entry, and then update the join table with the new movie
    
    static func addData(urlString: String, params: [String: String], updater: MediaUpdater, userID: Int) {
        guard let url = URL(string: urlString) else { return }
        do {
            let session = URLSession.shared
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let jsonData = try JSONSerialization.data(withJSONObject: params, options: [])
            let task = session.uploadTask(with: request, from: jsonData) { (data, response, error) in
                if let data = data {
                    let mediaItems = DataBaseJSONParser().parseJSON(data: data)
                    if !mediaItems.isEmpty, let mediaItem = mediaItems.first {
                        addNewMediaToUserList(mediaItem: mediaItem, userID: userID, updater: updater)
                    }
                }
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 201 {
                        getData(urlString: "http://localhost:3000/users-movies/\(userID)", updater: updater)
                        getData(urlString: "http://localhost:3000/users-shows/\(userID)", updater: updater)
                        getData(urlString: "http://localhost:3000/users-books/\(userID)", updater: updater)
                    }
                }
            }
            task.resume()
        } catch {
            print("Oops our json didn't serialize")
        }
    }
    
    static private func addNewMediaToUserList(mediaItem: MediaItem, userID: Int, updater: MediaUpdater) {
        let type = mediaItem.type.rawValue
        let mediaID = mediaItem.mediaID
        let url = "http://localhost:3000/\(type)sUpdateUserList"
        let params = [
            "userID": "1",
            "\(type)ID": "\(mediaID)",
            "hasWatched": "false"
        ]
        DataManager.addData(urlString: url, params: params, updater: updater, userID: userID)
    }
    
    //DELETE how the hell to do this? We just want to remove the item from the join table
}
