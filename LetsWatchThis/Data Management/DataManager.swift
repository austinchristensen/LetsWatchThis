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
}
