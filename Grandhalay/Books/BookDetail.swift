//
//  BookDetail.swift
//  Grandhalay
//
//  Created by Sailaja Nagireddy on 03/09/20.
//  Copyright © 2020 agnostic foundation. All rights reserved.
//

import SwiftUI

struct BookDetail: View {
    var book: Item
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                ImageStore.image(url: book.volumeInfo!.imageLinks!.thumbnailUrl, scale: 1, name: book.volumeInfo!.title!)
                Text(book.volumeInfo!.title!)
                    .font(.title)
                Text(book.volumeInfo!.subtitle ?? "")
                    .font(.subheadline)
            }
            .padding(.bottom)
            
            VStack(alignment: .leading) {
                Text("About this edition")
                    .font(.headline)
                HStack {
                    Text("ISBN")
                    ForEach((book.volumeInfo?.industryIdentifiers!)!, id: \.self) { industryIdentifier in
                        Text(industryIdentifier.identifier!)
                    }
                }
                
                HStack {
                    Text("Published")
                    Text(book.volumeInfo!.publishedDate!)
                }
                
                HStack {
                    Text("Publisher")
                    Text(book.volumeInfo!.publisher!)
                }
                
                VStack(alignment: .leading) {
                    Text("Author(s)")
                    ForEach(book.volumeInfo!.authors!, id: \.self) { author in
                        Text(author)
                    }
                }
            }
            .padding(.bottom)
            
            VStack(alignment: .leading) {
                Text("Descritpion")
                    .bold()
                Text(book.volumeInfo!.volumeInfoDescription ?? "")
            }
        }
        .padding()
    }
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: volumeResults.items![0])
    }
}
