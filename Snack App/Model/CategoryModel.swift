//
//  CategoryModel.swift
//  Snack App
//
//  Created by Aiden Yang on 2024/12/5.
//

import SwiftUI

struct CategoryModel: Identifiable, Hashable{
    var id : UUID = .init()
    var icon: String
    var title: String
}

var categoryList: [CategoryModel] = [
    CategoryModel(icon: "", title: "All"),
    CategoryModel(icon: "choco", title: "Choco"),
    CategoryModel(icon: "noodle", title: "Noodle"),
    CategoryModel(icon: "pizza", title: "Pizza"),
]
