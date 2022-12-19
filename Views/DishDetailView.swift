//
//  ItemDetail.swift
//  iDine
//
//  Created by Paul Hudson on 08/02/2021.
//

import SwiftUI

struct ItemDetail: View {
  @Environment(\.dismiss) var dismiss
  @EnvironmentObject var order: Order
  @ObservedObject var model = ViewModel()
  var item: Dish = Dish()
  
  var body: some View {
    //        VStack {
    //            ZStack(alignment: .bottomTrailing) {
    ////                Image(item.mainImage)
    ////                    .resizable()
    ////                    .scaledToFit()
    //
    ////                Text("Photo: \(item.photoCredit)")
    ////                    .padding(4)
    ////                    .background(Color.black)
    ////                    .font(.caption)
    ////                    .foregroundColor(.white)
    ////                    .offset(x: -5, y: -5)
    //            }
    //
    //            Text(item.name)
    //                .padding()
    //
    //
    //            Button("Order This") {
    //                order.add(item: item)
    ////              model.addToCart(Items: order.items)
    //              print(order.items[0].name)
    //              item.isAdded = true
    //
    //
    //            }
    //
    //            .font(.headline)
    //
    //            Spacer()
    //        }
    //        .navigationTitle(item.name)
    //        .navigationBarTitleDisplayMode(.inline)
    //    }
    
    
    ScrollView {
      VStack(alignment: .leading) {
        
        Image("cafedeadend")
          .resizable()
          .scaledToFill()
          .frame(minWidth: 0, maxWidth: .infinity)
          .frame(height: 400)
          .overlay {
            VStack {
              HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                  Text(item.name)
                    .font(.custom("Nunito-Regular", size: 35, relativeTo: .largeTitle))
                    .bold()
//
                  HStack {
                    
                    Text("$\(String(format: "%.2f", item.price))")
                      .font(.system(.headline, design: .rounded))
                      .padding(.all, 5)
                    .background(Color.black)
                    
                    Spacer()
                    
                    Text(item.group)
                      .font(.system(.headline, design: .rounded))
                      .padding(.all, 5)
                    .background(Color.black)
                    
                  }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                .foregroundColor(.white)
                .padding()
                
                //                          if let rating = restaurant.rating, !showReview {
                //                              Image(rating.image)
                //                                  .resizable()
                //                                  .frame(width: 60, height: 60)
                //                                  .padding([.bottom, .trailing])
                //                                  .transition(.scale)
                //                          }
              }
              //                      .animation(.spring(response: 0.2, dampingFraction: 0.3, blendDuration: 0.3), value: restaurant.rating)
              
            }
          }
        // Summary
        Text(item.name)
          .padding()
        
        HStack {
          Spacer()
          Button("Order This") {
                          order.add(item: item)
          //              model.addToCart(Items: order.items)
                        print(order.items[0].name)
                        item.isAdded = true
          
          
                      }
          .padding()
          .accentColor(.white)
          .font(.system(.title2, design: .rounded, weight: .bold))
          .background(Color.yellow)
          .cornerRadius(20)
          Spacer()
          
  //
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            dismiss()
                        }) {
                            Text("\(Image(systemName: "chevron.left"))")
                        }
  //                      .opacity(showReview ? 0 : 1)
                    }
          
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            item.isAdded.toggle()
//                          if item.isAdded == false {
//                            item.isAdded.toggle()
//                          }
//                          else {
//                            item.isAdded = false
//                          }
                        }) {
                            Image(systemName: item.isAdded ? "checkmark.circle.fill": "checkmark.circle")
                                .font(.system(size: 25))
                                .foregroundColor(item.isAdded ? .yellow : .white)
          
                        }
  //                      .opacity(showReview ? 0 : 1)
                    }
              }
        }
      }
//
    }
    .ignoresSafeArea()
  }
  
  struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
      NavigationView {
        ItemDetail(item: Dish.init())
          .environmentObject(Order())
      }
    }
  }
}
