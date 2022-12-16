//
//  TerraceView.swift
//  OrderOrganizer
//
//  Created by Aafrin Sayani on 2022-11-01.
//

import SwiftUI

struct TerraceView: View {
  
  @ObservedObject var model = ViewModel()
  @State var addingNewOrder = false
  
  private var gridItemLayout = [GridItem(.adaptive(minimum: 100),spacing: 20)]
  
  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVGrid(columns: gridItemLayout, alignment: .center, spacing: 20) {
          
          ForEach(model.Terracetables) { table in
            
            Button {
              addingNewOrder = true
            } label: {
              VStack {
                Text(table.name)
                  .font(.system(.title2, design: .rounded, weight: .bold))
                  .frame(minWidth: 100, maxWidth: .infinity)
                  .frame(height: 100)
                  .background(Color.yellow)
                  .cornerRadius(10)
                  .shadow(color: Color.primary.opacity(0.3), radius: 1)
                
              }   
            }
            .sheet(
              isPresented: $addingNewOrder,
//              content: MenuView.init
              content: MenuView.init
              
            )
            .accentColor(.black)
            
          }
        }
        .padding(.all, 10)
      }
      .navigationTitle("Terrace")
    }
  }
  
  init() {
    model.getTerraceTableData()
  }
}

struct TerraceView_Previews: PreviewProvider {
  static var previews: some View {
    TerraceView()
  }
}
