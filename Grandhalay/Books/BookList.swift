//
//  BookList.swift
//  Grandhalay
//
//  Created by Sailaja Nagireddy on 03/09/20.
//  Copyright © 2020 agnostic foundation. All rights reserved.
//

import SwiftUI

struct BookList: View {
    @State private var searchText: String = ""
    @State private var items = [Item]()

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("search for books of interest", text: $searchText)
                    Button(action: {
                        self.loadData()
                    }) {
                        Text("go")
                    }
                }
                .padding()
                
                List {
                    ForEach(self.items, id: \.id) { book in
                        NavigationLink(
                            destination: BookDetail(book: book)
                        ) {
                            BookRow(book: book)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Books"))
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        let encodedSearch: String = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://www.googleapis.com/books/v1/volumes?q=" + encodedSearch
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            do {
                let decodedResponse = try JSONDecoder().decode(VolumeResults.self, from: data!)
                DispatchQueue.main.async {
                    self.items = (decodedResponse.items ?? [])
                }
                return
            } catch {
                print("JSONDecoder failed.")
            }
            
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
        return
    }
}

struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList()
    }
}
