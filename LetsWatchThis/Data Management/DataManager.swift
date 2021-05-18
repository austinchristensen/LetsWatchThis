//
//  DataManager.swift
//  LetsWatchThis
//
//  Created by Austin Christensen on 4/7/21.
//

import Foundation

public class DataManager {
    static func getAllDataForUser(userID: Int, updater: MediaUpdater) {
        DispatchQueue.main.async {
            updater.resetMediaList()
        }
        DataManager.getData(urlString: "http://localhost:3000/users-movies/\(userID)", updater: updater)
        DataManager.getData(urlString: "http://localhost:3000/users-shows/\(userID)", updater: updater)
        DataManager.getData(urlString: "http://localhost:3000/users-books/\(userID)", updater: updater)
    }
    
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
    
    static func addData(urlString: String, params: [String: String], updater: MediaUpdater, userID: Int, isCompleted: Bool) {
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
                        print("$$$ we are calling addNewMediaToUserList from inside addData")
                        addNewMediaToUserList(mediaItem: mediaItem, userID: userID, updater: updater, isCompleted: isCompleted)
                    }
                }
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 201 {
                        print("$$$ we are calling getAllDataForUser from inside addData")
                        getAllDataForUser(userID: userID, updater: updater)
                    }
                }
            }
            task.resume()
        } catch {
            print("Oops our json didn't serialize")
        }
    }
    
    static private func addNewMediaToUserList(mediaItem: MediaItem, userID: Int, updater: MediaUpdater, isCompleted: Bool) {
        let type = mediaItem.type.rawValue
        let mediaID = mediaItem.mediaID
        let url = "http://localhost:3000/\(type)sUpdateUserList"
        let params = [
            "userID": "\(userID)",
            "\(type)ID": "\(mediaID)",
            "hasWatched": "\(isCompleted)"
        ]
        DataManager.addData(urlString: url, params: params, updater: updater, userID: userID, isCompleted: isCompleted)
    }
    
    static func updateIsCompleted(mediaItem: MediaItem, userID: Int, updater: MediaUpdater) {
        let type = mediaItem.type.rawValue
        let mediaID = mediaItem.mediaID
        let isCompleted = mediaItem.isCompleted
        let url = "http://localhost:3000/update\(type)IsCompleted"
        let params = [
            "isCompleted": "\(isCompleted)",
            "userID": "\(userID)",
            "mediaID": "\(mediaID)"
        ]
        DataManager.addData(urlString: url, params: params, updater: updater, userID: userID, isCompleted: isCompleted)
    }
    
    static func removeFromUsersList(userID: Int, mediaItem: MediaItem, updater: MediaUpdater) {
        guard let url = URL(string: "http://localhost:3000/users-\(mediaItem.type)s/\(userID)/\(mediaItem.mediaID)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        URLSession.shared.dataTask(with: request) {data, response, Error in
            let httpResponse = response as? HTTPURLResponse
            if httpResponse?.statusCode ?? 999 < 300 {
                getAllDataForUser(userID: 1, updater: updater)
            }
        }.resume()
    }
}
