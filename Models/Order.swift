//
//  Cart.swift
//  OrderOrganizer
//
//  Created by Aafrin Sayani on 2022-11-09.
//

import Foundation



struct Order: Identifiable{

  var id: String
//  var productName: String
//  var price: Float
//  var quantity: Int
  var items = [Dish]()
  
//  init(id: String = "", productName: String = "Chocolate Mousse", price: Float = 9, quantity: Int = 1) {
//    self.id = id
//    self.productName = productName
//    self.price = price
//    self.quantity = quantity
//  }
  
}
