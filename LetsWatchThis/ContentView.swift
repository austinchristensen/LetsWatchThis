//
//  ContentView.swift
//  LetsWatchThis
//
//  Created by Austin Christensen on 4/5/21.
//

import SwiftUI

struct ContentView: View {
    let categories = ["Movies", "Shows", "Books"]
    
    init() {
        UIToolbar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(categories, id: \.self) { category in
                        VStack(alignment: .leading) {
                            Text("My \(category):")
                                .font(.title)
                            HStack(alignment: .top, spacing: 10, content: {
                                ScrollView(.horizontal) {
                                    HStack() {
                                        ForEach(0..<10) { title in
                                            NavigationLink(destination: ItemDetailView()) {
                                                VStack {
                                                    Image("imagePlaceholder")
                                                        .resizable()
                                                        .frame(width: 80, height: 100)
                                                        .cornerRadius(25)
                                                    Text("Item \(title)")
                                                        .foregroundColor(.white)
                                                        .font(.title2)
                                                        .frame(width: 100, height: 20)
                                                }
                                            }
                                        }
                                    }
                                }
                                NavigationLink(destination: CategoryDetailView()) {
                                Text("View \nAll")
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
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    HStack(spacing: 20) {
                        Button(action: {
                            print("Home Button Pressed")
                        }, label: {
                            VStack {
                                Image(systemName: "house")
                                Text("Home")
                            }
                        })
                        
                        Button(action: {
                            print("Movies Button Pressed")
                        }, label: {
                            VStack {
                                Image(systemName: "film")
                                Text("Movies")
                            }
                        })
                        
                        Button(action: {
                            print("Shows Button Pressed")
                        }, label: {
                            VStack {
                                Image(systemName: "tv")
                                Text("Shows")
                            }
                        })
                        
                        Button(action: {
                            print("Books Button Pressed")
                        }, label: {
                            VStack {
                                Image(systemName: "book")
                                Text("Books")
                            }
                        })
                        
                        Button(action: {
                            print("Profile Button Pressed")
                        }, label: {
                            VStack {
                                Image(systemName: "person")
                                Text("Profile")
                            }
                        })
                    }
                }
            }
            .background(Color.black.opacity(0.6).edgesIgnoringSafeArea(.all))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
