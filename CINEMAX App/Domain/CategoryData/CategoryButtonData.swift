//
//  Category.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 24.07.24.
//

import UIKit

struct CategoryButtonData {
    let buttonName: String
    var isSelected: Bool
}
    var buttonCategoryData = [
        CategoryButtonData.init(buttonName: "All", isSelected: true),
        CategoryButtonData.init(buttonName: "Comedy", isSelected: false),
        CategoryButtonData.init(buttonName: "Animation", isSelected: false),
        CategoryButtonData.init(buttonName: "Documental", isSelected: false),
        CategoryButtonData.init(buttonName: "Fantasy", isSelected: false),
        CategoryButtonData.init(buttonName: "Drama", isSelected: false)
    ]

