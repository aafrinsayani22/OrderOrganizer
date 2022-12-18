//
//  Menu.swift
//  OrderOrganizer
//
//  Created by Aafrin Sayani on 2022-11-09.
//

import SwiftUI

struct NewMenuView: View {

  @ObservedObject var model = ViewModel()
//  @EnvironmentObject var cart: Cart
//  @EnvironmentObject var order: Order
//  let item: Dish
  var body: some View {
    
    NavigationView {

      List {
        Section(header: Text("Food").font(.system(size: 19, weight: .black))) {
          ForEach(model.items) { item in
            if item.group == "Food" {
              NavigationLink(destination: ItemDetail(item: item)) {
                DishRow(dish: item)
              }
             
            }
          }
         
        }
        Section(header: Text("Drinks").font(.system(size: 19, weight: .black))) {
          ForEach(model.items) { item in
            if item.group == "Drinks" {
              NavigationLink(destination: ItemDetail(item: item)) {
                DishRow(dish: item)
              }
//              DishRow(dish: item)
            }
          }
          
        }
        Section(header: Text("Dessert").font(.system(size: 19, weight: .black))) {
          ForEach(model.items) { item in
            if item.group == "Dessert" {
              NavigationLink(destination: ItemDetail(item: item)) {
                DishRow(dish: item)
              }
//              DishRow(dish: item)
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
//            cart.add(item: item)
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

struct Menu_Previews: PreviewProvider {
  static var previews: some View {
    NewMenuView()
//      .environmentObject(Cart())
  }
}
