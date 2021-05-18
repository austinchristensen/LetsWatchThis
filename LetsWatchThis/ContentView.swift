//
//  ContentView.swift
//  LetsWatchThis
//
//  Created by Austin Christensen on 4/5/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingMovieDetailView = false
    @State private var isShowingShowDetailView = false
    @State private var isShowingBookDetailView = false
    @ObservedObject var updater = MediaUpdater()
    let userID = 1

    let categories = [MediaType.movie, MediaType.show, MediaType.book]
    
    init() {
        UIToolbar.appearance().barTintColor = UIColor.black
        DataManager.getAllDataForUser(userID: userID, updater: updater)
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(categories, id: \.self) { category in
                        VStack(alignment: .leading) {
                            Text("My \(category.rawValue.capitalizingFirstLetter())s:")
                                .font(.title)
                            HStack(alignment: .top, spacing: 10, content: {
                                ScrollView(.horizontal) {
                                    HStack() {
                                        ForEach(updater.mediaList, id: \.id) { item in
                                            if (item.type == category) {
                                                NavigationLink(destination: ItemDetailView(item: item, userID: userID, updater: updater)) {
                                                    VStack {
                                                        Image("\(item.imagePath)")
                                                            .resizable()
                                                            .frame(width: 100, height: 100)
                                                            .cornerRadius(25)
                                                            .allowsTightening(true)
                                                        Text(item.title)
                                                            .foregroundColor(.white)
                                                            .font(.title2)
                                                            .frame(width: 100, height: 20)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                NavigationLink(destination: ListDetailView(items: categoryToDisplay(type: category), title: "My \(category.rawValue.capitalizingFirstLetter())s:", userID: userID, updater: updater)) {
                                    Text("View \nAll\n\(category.rawValue.capitalizingFirstLetter())s")
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .frame(width: 90, height: 100)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25.0)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                                    .multilineTextAlignment(.center)
                                }
                            })
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Lets Watch This!")
            .navigationBarItems(trailing: Button(action: {
                print("Profile Button Pressed")
            }, label: {
                VStack {
                    Image(systemName: "person")
                    Text("Profile")
                }
            }))
            .background(Color.black.opacity(0.6).edgesIgnoringSafeArea(.all))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func categoryToDisplay(type: MediaType) -> [MediaItem] {
        var listToReturn: [MediaItem] = []
        updater.mediaList.forEach { item in
            if item.type == type {
                listToReturn.append(item)
            }
        }
        return listToReturn
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
