//
//  OrderOrganizerViews.swift
//  OrderOrganizer
//
//  Created by Aafrin Sayani on 2022-11-03.
//

import SwiftUI


private var colors: [Color] = [.yellow, .purple, .green]
private var gridItemLayout = [GridItem(.adaptive(minimum: 100),spacing: 20)]



struct BasicTextImageRow: View {
    
    @ObservedObject var item: Dish
    
    @State private var showOptions = false
    @State private var showError = false
    
    var body: some View {
      
        HStack(alignment: .top, spacing: 20) {
//            if let imageData = item.image {
//                Image(uiImage: UIImage(data: imageData) ?? UIImage())
//                    .resizable()
//                    .frame(width: 120, height: 118)
//                    .cornerRadius(20)
//            }
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.system(.title2, design: .rounded))
                
//              Text(item.group)
//                    .font(.system(.body, design: .rounded))
                
              Text("$\(String(format: "%.2f", item.price))")
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)
            }
            
          if item.isAdded {
                Spacer()
                
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.yellow)
            }
          else{
            Spacer()
            
            Image(systemName: "checkmark.circle")
                .foregroundColor(.yellow)
            
          }
        }
        .contextMenu {
            
            Button(action: {
                self.showError.toggle()
            }) {
                HStack {
                    Text("Reserve a table")
                    Image(systemName: "phone")
                }
            }
            
            Button(action: {
                self.item.isAdded.toggle()
            }) {
                HStack {
                    Text(item.isAdded ? "Remove from Order" : "Add to Order")
                    Image(systemName: "heart")
                }
            }
            
            Button(action: {
                self.showOptions.toggle()
            }) {
                HStack {
                    Text("Share")
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
        .alert(isPresented: $showError) {
            Alert(title: Text("Not yet available"),
                  message: Text("Sorry, this feature is not available yet. Please retry later."),
                  primaryButton: .default(Text("OK")),
                  secondaryButton: .cancel())
        }
        
    }
}


struct DishRow: View {

  var dish: Dish

  
  var body: some View {
    HStack{
      VStack(alignment: .leading) {
        
        let formattedFloat = String(format: "%.2f", dish.price)
        VStack(alignment: .leading, spacing: 8) {
          Text(dish.name)
            .font(.system(size: 19, design: .rounded))
            .font(.headline)
          Text("$" + formattedFloat)
            .font(.system(size: 16, weight: .bold))
        }
      }
      .lineLimit(2)
      Spacer()
     
//      QuantityButton(dish: .init(name: dish.name, price: dish.price, group: dish.group, quantity: dish.quantity), cart: .init())
//        .buttonStyle(BorderlessButtonStyle())
//        .font(.system(size: 15, design: .rounded))
      
    }
    .padding()
  }
}

struct QuantityButton: View {
  @ObservedObject var model = ViewModel()
  @ObservedObject var dish: Dish
//  var items: [Dish]
  @EnvironmentObject var cart: Cart
//  var items : [Dish]
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
//        cart.add(item: dish)
//        cart.items.append(dish)
//        model.addToCart(Items: cart.items)
        
      } label: {
        Image(systemName: "plus")
          .font(.system(size: 20, weight: .light))
          .padding()
      }
      .accentColor(.black)

    }
  }


struct ItemRow: View {
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]

    let item = Dish()

    var body: some View {
        HStack {
            Image("")
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))

            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }

//            Spacer()

//            ForEach(item.restrictions, id: \.self) { restriction in
//                Text(restriction)
//                    .font(.caption)
//                    .fontWeight(.black)
//                    .padding(5)
//                    .background(colors[restriction, default: .black])
//                    .clipShape(Circle())
//                    .foregroundColor(.white)
//            }
        }
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
        .environmentObject(Order())
      ItemRow()
      BasicTextImageRow(item: Dish())
    }
  }
}
