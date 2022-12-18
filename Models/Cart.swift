//
//  Cart.swift
//  OrderOrganizer
//
//  Created by Aafrin Sayani on 2022-12-08.
//

import Foundation

//class Cart: Identifiable{
////  var id: ObjectIdentifier
//
//    var id: String
//    var item: Dish
//  var quantity: Int = 0
//}
class Cart: Identifiable, ObservableObject {
//  var id: String = ""
  @Published var items = [Dish]()

//  var name: String
//  @Published var quantity: Int
  
  func add(item: Dish) {
      items.append(item)
  }
  
//  init(items: [Dish] = [Dish()], id: String) {
//    self.items = items
////    self.id = id
////    self.name = name
////    self.quantity = quantity
//  }
}
