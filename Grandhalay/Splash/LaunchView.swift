//
//  LaunchView.swift
//  Grandhalay
//
//  Created by Sailaja Nagireddy on 03/09/20.
//  Copyright © 2020 agnostic foundation. All rights reserved.
//

import SwiftUI

struct LaunchView: View {
    @State var isActive:Bool = false
    
    var body: some View {
        VStack {
            if self.isActive {
                BookList()
            } else {
                Text("Welcome to Grandhalay!")
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
