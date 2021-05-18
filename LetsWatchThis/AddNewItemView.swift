//
//  AddNewItemView.swift
//  LetsWatchThis
//
//  Created by Austin Christensen on 5/11/21.
//

import SwiftUI

struct AddNewItemView: View {
    public let userId: Int
    public let updater: MediaUpdater
    public var imagePath: String
    
    @State var defaultImagePath: String
    @State private var title = ""
    @State private var description = ""
    @State private var showErrorMessage: Bool = false
    @State public var mediaType: String
    @State var hasWatched: Bool = false
    
    
    init(imagePath: String, userId: Int, updater: MediaUpdater, mediaType: String) {
        self.imagePath = imagePath
        self._defaultImagePath = State(wrappedValue: imagePath)
        self.userId = userId
        self.updater = updater
        self.mediaType = mediaType
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
                TextField("Image Path", text: $defaultImagePath)
                    .disabled(true)
                    .foregroundColor(.gray)
                TextField("Media Type", text: $mediaType)
                    .disabled(true)
                    .foregroundColor(.gray)
                HStack {
                    let consumptionType = mediaType != "book" ? "watched" : "read"
                    Text("Have you \(consumptionType) this?")
                    Toggle("\(consumptionType.capitalizingFirstLetter())?", isOn: $hasWatched).labelsHidden()
                }
                Button("Save") {
                    saveItem(itemTitle: title, description: description, mediaType: mediaType, imagePath: defaultImagePath, userID: userId)
                }
            }
            .alert(isPresented: $showErrorMessage) {
                Alert(title: Text("Error"), message: Text("Missing TITLE or DESCRIPTION"), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    private func saveItem(itemTitle: String, description: String, mediaType: String, imagePath: String, userID: Int) {
        guard title != "", description != "" else { return }
        let json = [
            "title": itemTitle,
            "summary": description,
            "mediaType": mediaType,
            "imagePath": imagePath
        ]
        let urlString = "http://localhost:3000/\(mediaType)s"
        
        DataManager.addData(urlString: urlString, params: json, updater: updater, userID: userID, isCompleted: hasWatched)
    }
}

//struct AddNewItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNewItemView()
//    }
//}
