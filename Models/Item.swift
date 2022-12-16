//
//  Item.swift
//  OrderOrganizer
//
//  Created by Aafrin Sayani on 2022-12-08.
//

import Foundation

struct Item: Identifiable {
    var id: String
    var item_name: String
    var item_cost: NSNumber
    var item_details: String
    var item_image: String
    var item_ratings: String
    // To identify whether it is added to the cart
    var isAdded: Bool = false
}
