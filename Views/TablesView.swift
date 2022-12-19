//
//  MenuOptions.swift
//  OrderOrganizer
//
//  Created by Aafrin Sayani on 2022-12-18.
//

import SwiftUI

struct TableOptions: View {
  @EnvironmentObject var order: Order
  @State private var showingGarden = false
  @State private var showingTerrace = false
  @State private var showingFloor = false
  var body: some View {
    List {
 
      
      ZStack() {
        Spacer()
        Image("cafedeadend")
          .resizable()
          .scaledToFill()
          .frame(height: 150)
          .cornerRadius(20)
        Color.black
          .frame(height: 100)
          .opacity(0.5)
          .cornerRadius(20)
          .padding()
        
        
        VStack(alignment: .leading) {
          Button("Terrace") {
            showingTerrace.toggle()
          }
          .sheet(isPresented: $showingTerrace) {
            TerraceView()
              
          }
          
          .font(.system(.title, design: .rounded, weight: .bold))
          
        }
        .accentColor(.yellow)
        .padding(.horizontal)
        .padding(.bottom)
      }
      
      ZStack() {
        Image("traif")
          .resizable()
          .scaledToFill()
          .frame(height: 150)
          .cornerRadius(20)
        Color.black
          .frame(height: 100)
          .opacity(0.5)
          .cornerRadius(20)
          .padding()
        
        
        VStack(alignment: .leading) {
          Button("Garden") {
            showingGarden.toggle()
          }
          .sheet(isPresented: $showingGarden) {
            GardenView()
          }
          .font(.system(.title, design: .rounded,weight: .bold))
          
        }
        .accentColor(.yellow)
        .padding(.horizontal)
        .padding(.bottom)
      }
      ZStack() {
        Image("teakha")
          .resizable()
          .scaledToFill()
          .frame(height: 150)
          .cornerRadius(20)
        Color.black
          .frame(height: 100)
          .opacity(0.5)
          .cornerRadius(20)
          .padding()
        
        
        VStack(alignment: .leading) {
          Button("Floor") {
            showingFloor.toggle()
          }
          .sheet(isPresented: $showingFloor) {
            FloorView()
          }
          
          .font(.system(.title, design: .rounded, weight: .bold))
          
        }
        .accentColor(.yellow)
        .padding(.horizontal)
        .padding(.bottom)
      }
      .listRowSeparator(.hidden)
    }
    
    
//    .listStyle(.plain)
    
  }
  
  
  
  
    
  
}

struct MenuOptions_Previews: PreviewProvider {
  static var previews: some View {
    TableOptions()
      .environmentObject(Order())
  }
}

