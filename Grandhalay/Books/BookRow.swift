//
//  BookRow.swift
//  Grandhalay
//
//  Created by Sailaja Nagireddy on 03/09/20.
//  Copyright © 2020 agnostic foundation. All rights reserved.
//

import SwiftUI

struct BookRow: View {
    var book: Item
    
    var body: some View {
        HStack {
            ImageStore.image(url: book.volumeInfo!.imageLinks!.thumbnailUrl, scale: 4, name: book.volumeInfo!.title!)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(book.volumeInfo!.title!)
                    .font(.headline)
                Text(book.volumeInfo?.subtitle ?? "")
                    .font(.subheadline)
            }
        }
    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        BookRow(book: volumeResults.items![0])
    }
}
