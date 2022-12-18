//
//  ItemDetail.swift
//  iDine
//
//  Created by Paul Hudson on 08/02/2021.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
  @ObservedObject var model = ViewModel()
    let item: Dish

    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
//                Image(item.mainImage)
//                    .resizable()
//                    .scaledToFit()
         
//                Text("Photo: \(item.photoCredit)")
//                    .padding(4)
//                    .background(Color.black)
//                    .font(.caption)
//                    .foregroundColor(.white)
//                    .offset(x: -5, y: -5)
            }

            Text(item.name)
                .padding()
           

            Button("Order This") {
                order.add(item: item)
//              model.addToCart(Items: order.items)
              print(order.items[0])
              
              
            }
          
            .font(.headline)

            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
          ItemDetail(item: Dish.init())
                .environmentObject(Order())
        }
    }
}
