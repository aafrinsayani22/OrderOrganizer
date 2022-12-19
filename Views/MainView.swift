//
//  MainView.swift
//  iDine
//
//  Created by Paul Hudson on 08/02/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
      
        TabView {
            TableOptions()
                .tabItem {
                    Label("Tables", systemImage: "list.dash")
                }

            OrderView()
                .tabItem {
                    Label("Checkout", systemImage: "square.and.pencil")
                }
        }
      
      
      
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Order())
    }
}
