//
//  ContentView.swift
//  OrderOrganizer
//
//  Created by Aafrin Sayani on 2022-11-01.
//

import SwiftUI

struct ContentView: View {
  
//  @EnvironmentObject var order: Order
  
  @State private var selectedTabIndex = 0
  
  var body: some View {
    TabView(selection: $selectedTabIndex) {
      GardenView()
        .tabItem {
          Label("Garden", systemImage: "leaf.fill")
        }
        .tag(0)
      
     TerraceView()
        .tabItem {
          Label("Floor1", systemImage: "house.fill")
        }
        .tag(1)
      
      TerraceView()
        .tabItem {
          Label("Terrace", systemImage: "lamp.floor")
        }
        .tag(2)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
