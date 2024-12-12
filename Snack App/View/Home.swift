//
//  Home.swift
//  Snack App
//
//  Created by Aiden Yang on 2024/12/5.
//

import SwiftUI

struct Home: View {
    
    // Category View Properties
    @State var selectedCategory = "Choco"
    
    @EnvironmentObject var cartManager : CartManager
    
    var body: some View {
        NavigationView{
            
            ScrollView{
                VStack{
                    // Header
                    HStack{
                        Text("Order From The Best OF **Snacks**")
                            .font(.system(size: 36))
                        
                        Spacer()
                        
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70, height: 90)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke()
                                    .opacity(0.4)
                            )
                        
                        // Category List
                    }
                    .padding(30)
                    
                    // Category List
                    CategoryListView
                    
                    // Collection View
                    HStack{
                        Text("Choco **Collection**")
                            .font(.system(size: 24))
                        
                        Spacer()
                        
                        NavigationLink{
                            CollectionView()
                        }label: {
                            Image(systemName: "arrow.right")
                                .imageScale(.large)
                        }
                        .foregroundStyle(.black)
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    
                    // Product List
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(productList, id: \.id){ item in
                                ProductCard(product: item)
                            }
                        }
                    }
                }
            }
        }
    }
    
    // Category List View
    var CategoryListView: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    ForEach(categoryList, id: \.id){item in
                        Button {
                            selectedCategory = item.title
                        }label:{
                            HStack{
                                if item.title != "All" {
                                    Image(item.icon)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                }
                                
                                Text(item.title)
                            }
                            .padding()
                            .background(
                                selectedCategory == item.title ? .purple: .gray
                                    .opacity(0.2)
                            )
                            .foregroundStyle(
                                selectedCategory == item.title ? .black
                                : .gray)
                            .clipShape(Capsule())
                        }
                    }
                }
                .padding(.horizontal, 30)
            }
        }
    }
}

#Preview {
    Home()
        .environmentObject(CartManager())
}


// Product card View
struct ProductCard: View {
    var product: Product
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing, -200)
                .rotationEffect(Angle(degrees: 30))
            
            ZStack {
                VStack(alignment: .leading, content: {
                    Text(product.name)
                        .font(.system(size: 36, weight: .semibold))
                        .frame(width: 140)
                    
                    Text(product.category)
                        .font(.callout)
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    HStack {
                        Text("$\(product.price).0")
                            .font(.system(size: 24, weight: .semibold))
                        
                        Spacer()
                        
                        Button{
                            print("hello")
                            cartManager.addToCart(product: product)
                        }label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 90, height: 68)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundStyle(.white)
                        }
                    }
                    .padding(.leading)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(.white.opacity(0.9))
                    .clipShape(Capsule())
                })
            }
            .padding(30)
            .frame(width: 336, height: 422)
        }
        .frame(width: 336, height: 422)
        .background(product.color.opacity(0.2))
        .clipShape(.rect(cornerRadius: 60))
        .padding(.leading, 20)
    }
}
