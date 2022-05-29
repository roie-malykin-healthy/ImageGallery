//
//  ImageGalleryModel.swift
//  ImageGallery
//
//  Created by Roie Malykin on 25/05/2022.
//
import Foundation
/// This struct Represents an Image gallery model
struct ImageGalleryModel {
    // MARK: - Attributes
    var name: String
    var images: [URL]
    var ratio: [Float]
    var width: Float
    
    init(name: String) {
        self.name = name
        self.imageUrls = [URL]()
        self.width = 40 // Default 40
    }
    // Add 
}
