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
import UIKit
class Dish: ObservableObject,Identifiable,Equatable {
  
  static func == (lhs: Dish, rhs: Dish) -> Bool {
    lhs === rhs
  }
  
  
  var id: String
  var name: String
  var price: Float
  var group: String
  var image: String
  var isAdded: Bool
  
  @Published var quantity: Int
  
  init(id: String = "0", name: String = "Chocolate Mousse", price: Float = 10.0, group: String = "Dessert", quantity: Int = 1, image: String = "", isAdded: Bool = false) {
      self.id = id
      self.name = name
      self.price = price
      self.group = group
      self.quantity = quantity
      self.image = image
      self.isAdded = isAdded
    }
  }

