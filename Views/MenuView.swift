//
//  Menu.swift
//  OrderOrganizer
//
//  Created by Aafrin Sayani on 2022-11-09.
//

import SwiftUI

struct MenuView: View {
  
  @ObservedObject var model = ViewModel()

  var body: some View {
    
    NavigationView {
      
      
      
      
      List {
        Section(header: Text("Food").font(.system(size: 19, weight: .black))) {
          ForEach(model.items) { item in
            if item.group == "Food" {
              DishRow(dish: item)
            }
          }
         
        }
        Section(header: Text("Drinks").font(.system(size: 19, weight: .black))) {
          ForEach(model.items) { item in
            if item.group == "Drinks" {
              DishRow(dish: item)
            }
          }
          
        }
        Section(header: Text("Dessert").font(.system(size: 19, weight: .black))) {
          ForEach(model.items) { item in
            if item.group == "Dessert" {
              DishRow(dish: item)
            }
          }
        }
        .navigationTitle("Menu")
      }
      .listStyle(GroupedListStyle())
      .toolbar {
        ToolbarItem {
          Button {
            // Add to the database
//            order.add(item: item)
          } label: {
            Image(systemName: "cart")
              .font(.system(size: 20, weight: .light))
              .padding()
          }
        }
      }
    }
  }
  init() {
    model.getMenuData()
  }

}

struct Menu_View_Previews: PreviewProvider {
  static var previews: some View {
    MenuView()
  }
}
