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
//                NavigationLink("My Movies", destination: ListDetailView(items: usersMovies, title: "My Movies:"), isActive: $isShowingMovieDetailView).hidden()
//                NavigationLink("My Shows", destination: ListDetailView(items: usersShows, title: "My Shows:"), isActive: $isShowingMovieDetailView).hidden()
//                NavigationLink("My Books", destination: ListDetailView(items: usersBooks, title: "My Books:"), isActive: $isShowingMovieDetailView).hidden()
            }
            .navigationTitle("Lets Watch This!")
//            .toolbar {
//                ToolbarItemGroup(placement: .bottomBar) {
//                    HStack(spacing: 20) {
//                        Button(action: {
//                            print("Home Button Pressed")
//                        }, label: {
//                            VStack {
//                                Image(systemName: "house")
//                                Text("Home")
//                            }
//                        })
//
//                        Button(action: {
//                            print("Movies Button Pressed")
//                            isShowingMovieDetailView.toggle()
//                            let json = [
//                                "title": "Test Movie Insert",
//                                "summary": "Test Movie 1 Test Descriptions",
//                                "mediaType": "movie",
//                                "imagePath": "imagePlaceholder"
//                            ]
//                            let urlString = "http://localhost:3000/movies"
//
//                            DataManager.addData(urlString: urlString, params: json, updater: updater, userID: userID)
//                        }, label: {
//                            VStack {
//                                Image(systemName: "film")
//                                Text("Movies")
//                            }
//                        })
//
//                        Button(action: {
//                            print("Shows Button Pressed")
//                            isShowingShowDetailView.toggle()
//                            let json = [
//                                "title": "Test Show Insert",
//                                "summary": "Test Show 1 Test Descriptions",
//                                "mediaType": "show",
//                                "imagePath": "imagePlaceholder"
//                            ]
//                            let urlString = "http://localhost:3000/shows"
//
//                            DataManager.addData(urlString: urlString, params: json, updater: updater, userID: userID)
//                        }, label: {
//                            VStack {
//                                Image(systemName: "tv")
//                                Text("Shows")
//                            }
//                        })
//
//                        Button(action: {
//                            print("Books Button Pressed")
//                            isShowingBookDetailView.toggle()
//                            let json = [
//                                "title": "Test Book Insert",
//                                "summary": "Test Book 1 Test Descriptions",
//                                "mediaType": "book",
//                                "imagePath": "imagePlaceholder"
//                            ]
//                            let urlString = "http://localhost:3000/books"
//
//                            DataManager.addData(urlString: urlString, params: json, updater: updater, userID: userID)
//                        }, label: {
//                            VStack {
//                                Image(systemName: "book")
//                                Text("Books")
//                            }
//                        })
//
//                        Button(action: {
//                            print("Profile Button Pressed")
//                        }, label: {
//                            VStack {
//                                Image(systemName: "person")
//                                Text("Profile")
//                            }
//                        })
//                    }
//                }
//            }
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
