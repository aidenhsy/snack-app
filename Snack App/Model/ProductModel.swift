//
//  ProductModel.swift
//  Snack App
//
//  Created by Aiden Yang on 2024/12/5.
//

import SwiftUI

// Product Model
struct Product: Identifiable {
    var id: UUID = .init()
    var name: String
    var category: String
    var image: String
    var color: Color
    var price: Int
}

// Sample Products
var productList = [
    Product(
        name: "Good Source",
        category: "Choco",
        image: "image1",
        color: .pink,
        price: 11
    ),
    Product(
        name: "Unreal Muffins",
        category: "Choco",
        image: "image2",
        color: .yellow,
        price: 7
    ),
    Product(
        name: "Twister Chips",
        category: "Noodle",
        image: "image3",
        color: .red,
        price: 9
    ),
    Product(
        name: "Regular Nature",
        category: "Pizza",
        image: "image4",
        color: .green,
        price: 19),
    Product(
        name: "Dark Russet",
        category: "Pizza",
        image: "image5",
        color: .orange,
        price: 8
    ),
    Product(
        name: "Smith Chips",
        category: "Noodle",
        image: "image6",
        color: .brown,
        price: 5
    ),
    Product(
        name: "Deep River",
        category: "Pizza",
        image: "image7",
        color: .blue,
        price: 11
    ),
]
