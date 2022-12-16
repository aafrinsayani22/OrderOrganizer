//
//  OrderOrganizerViews.swift
//  OrderOrganizer
//
//  Created by Aafrin Sayani on 2022-11-03.
//

import SwiftUI


private var colors: [Color] = [.yellow, .purple, .green]
private var gridItemLayout = [GridItem(.adaptive(minimum: 100),spacing: 20)]

struct DishRow: View {

  var dish: Dish
  
  var body: some View {
    HStack{
      VStack(alignment: .leading) {
        
        let formattedFloat = String(format: "%.2f", dish.price)
        VStack(alignment: .leading, spacing: 8) {
          Text(dish.name)
            .font(.system(size: 19, design: .rounded))
          Text("$" + formattedFloat)
            .font(.system(size: 16, weight: .bold))
        }
      }
      .lineLimit(2)
      Spacer()
      QuantityButton(dish: .init(name: dish.name, price: dish.price, group: dish.group, quantity: dish.quantity))
        .buttonStyle(BorderlessButtonStyle())
        .font(.system(size: 15, design: .rounded))
      
    }
    .padding()
  }
}

struct QuantityButton: View {
  @ObservedObject var model = ViewModel()
  @ObservedObject var dish: Dish
//var items: [Dish]
//  @Published var items = [Dish]()
  @State var addingNewDish = false
  var body: some View {
      Button {
        if dish.quantity > 0{
          dish.quantity -= 1
//          model.addToCart(name: dish.name, quantity: dish.quantity)

        }
      } label: {
        Image(systemName: "minus")
          .font(.system(size: 20, weight: .light))
          .padding()
      }

      .accentColor(.black)

      Text("\(dish.quantity)")
        .font(.system(size: 20, weight: .bold, design: .rounded))


      Button {
        dish.quantity += 1
//        items.append(dish)
        model.addToCart(name: dish.name, quantity: dish.quantity)
        
        
      } label: {
        Image(systemName: "plus")
          .font(.system(size: 20, weight: .light))
          .padding()
      }
      .accentColor(.black)

    }
  }

struct TableView: View {
  let text: String
  let i: Int
  
  var body: some View {
    Text("\(text)\(i+1)")
      .font(.system(.title2, design: .rounded, weight: .bold))
      .frame(minWidth: 100, maxWidth: .infinity)
      .frame(height: 100)
      .background(.purple)
      .cornerRadius(10)
      .shadow(color: Color.primary.opacity(0.3), radius: 1)
      .padding()
  }
  
  
}


struct OrderOrganizerViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      TableView(text: "T", i: 1)
      DishRow(dish: .init(id: "jkh", name: "Fish", price: 12, group: "Food", quantity: 1))
    }
  }
}
