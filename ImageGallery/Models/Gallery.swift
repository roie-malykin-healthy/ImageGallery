//
//  Gallery.swift
//  ImageGallery
//
//  Created by Roie Malykin on 29/05/2022.
//

import Foundation
/// This container class holds an image gallery
final class Gallery {
    // MARK: - Attributes
    private(set) var name: String
    private(set) var imgaes: [URL]
    init(name: String) {
        self.name = name
        self.imgaes = [URL]()
    }
    // MARK: - Functions
    func addImage(url: URL) {
        imgaes.append(url)
    }
    func changeGalleryName(newName: String) {
        name = newName
    }
}
