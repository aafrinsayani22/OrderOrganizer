//
//  OrdersViewModel.swift
//  OrderOrganizer
//
//  Created by Aafrin Sayani on 2022-11-07.
//

import Foundation
import SwiftUI
import FirebaseCore
import FirebaseFirestore

class ViewModel: ObservableObject {
  
  @Published var Terracetables = [Table]()
  @Published var Gardentables = [Table]()
  @Published var cartItems : [Cart] = []
  @Published var items = [Dish]()
  
//  func addData(items: [Dish]){
//
//    // Get a reference to the database
//    let db = Firestore.firestore()
//
//    // Add a document to a collection
//    db.collection("orders").addDocument(data: ["dishes":items]) { error in
//
//      // Check for errors
//      if error == nil {
//        // No errors
//
//        // Call get data to retrieve latest data
//        //              self.getData()
//      }
//      else {
//        // Handle the error
//      }
//    }
//  }
  
  func getGardenTableData() {
    
    // Get a reference to the database
    let db = Firestore.firestore()
    
    //Read the document at a specific path
    db.collection("garden").getDocuments { snapshot, error in
      // check for errors
      if error == nil {
        // no errors
        if let snapshot = snapshot {
          
          // update the tables property in the main thread
          DispatchQueue.main.async {
            
            // get all the documents and create tables
            self.Gardentables =  snapshot.documents.map { d in
              
              //Create a table for each document returned
              return Table(id:  d.documentID,
                           name: d["name"] as? String ?? "no table",
                           status: d["status"] as? Bool ?? true
                           
              )
              
            }
            
          }
        }
      }
    }
  }
  
  func addToCart(name: String, quantity: Int) {
    

    // Get a reference to the database
    let db = Firestore.firestore()
    
    // Add a document to a collection
    db.collection("Cart").addDocument(data: ["Item": name, "Quantity": quantity]) { error in
        
        // Check for errors
        if error == nil {
            // No errors
            
            // Call get data to retrieve latest data
//            self.getCartData()
        }
        else {
            // Handle the error
        }
    }
      
  }
//  func getIndex(item: Dish, isCartIndex: Bool) -> Int {
//
//    let index = self.items.firstIndex { (item1) -> Bool in
//
//      return item.id == item1.id
//
//    } ?? 0
//
//    let cartIndex = self.cartItems.firstIndex { (item1) -> Bool in
//
//      return item.id == item1.item.id
//
//    } ?? 0
//
//    return isCartIndex ? cartIndex : index
//  }
//
//  func calculateTotalPrice() -> String {
//    var price: Float = 0
//
//    cartItems.forEach { item in
//      price += Float(item.quantity) * Float(truncating: item.item.price as NSNumber)
//
//    }
//    return getPrice(value: price)
//  }
  
//  func  getPrice(value: Float) -> String {
//    
//    let format = NumberFormatter()
//    format.numberStyle = .currency
//    
//    return format.string(from: NSNumber(value: value)) ?? ""
//    
//  }
  func getMenuData() {
    
    // Get a reference to the database
    let db = Firestore.firestore()
    
    //Read the document at a specific path
    db.collection("menu").getDocuments { snapshot, error in
      // check for errors
      if error == nil {
        // no errors
        if let snapshot = snapshot {
          
          // update the tables property in the main thread
          DispatchQueue.main.async {
            
            // get all the documents and create tables
            self.items =  snapshot.documents.map { d in
              
              //Create a table for each document returned
              return Dish(id: d.documentID,
                          name: d["name"] as? String ?? "no dish",
                          price: d["price"] as? Float ?? 0.00,
                          group: d["group"] as? String ?? "no group",
                          quantity: 0)
              
            }
          }
        }
      }
    }
  }
  
  func getTerraceTableData() {
    
    // Get a reference to the database
    let db = Firestore.firestore()
    
    //Read the document at a specific path
    db.collection("tables").getDocuments { snapshot, error in
      // check for errors
      if error == nil {
        // no errors
        if let snapshot = snapshot {
          
          // update the tables property in the main thread
          DispatchQueue.main.async {
            
            // get all the documents and create tables
            self.Terracetables =  snapshot.documents.map { d in
              
              //Create a table for each document returned
              return Table(id:  d.documentID,
                           name: d["name"] as? String ?? "no table",
                           status: d["status"] as? Bool ?? true)
              
              
            }
            
          }
        }
      }
    }
  }
}

