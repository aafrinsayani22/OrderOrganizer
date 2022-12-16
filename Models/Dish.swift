//
//  Dish.swift
//  OrderOrganizer
//
//  Created by Aafrin Sayani on 2022-11-08.
//

//import Foundation
//
//struct Dish: Identifiable, ObservableObject {
//
//  var id: String
//  var name: String
//  var price: Float
//  var group: String
//  var quantity: Int
//
//  init(id: String = "0", name: String = "Chocolate Mousse", price: Float = 10.0, group: String = "Dessert", quantity: Int = 0) {
//    self.id = id
//    self.name = name
//    self.price = price
//    self.group = group
//    self.quantity = quantity
//  }
//}
import Foundation
class Dish: ObservableObject,Identifiable {
  var id: String
  var name: String
  var price: Float
  var group: String
  var isAdded: Bool = false
  @Published var quantity: Int
  
  init(id: String = "0", name: String = "Chocolate Mousse", price: Float = 10.0, group: String = "Dessert", quantity: Int = 1) {
      self.id = id
      self.name = name
      self.price = price
      self.group = group
      self.quantity = quantity
    }
  }

