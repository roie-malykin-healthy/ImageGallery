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
    private var name: String
    var images: [URL]
    var ratio: [Float]
    init(name: String) {
        self.name = name
        self.images = [URL]()
        self.ratio = [Float]()
    }
    // MARK: - Functions
    func addImage(url: URL) {
        images.append(url)
        // Calc ratio
    }
    func changeGalleryName(newName: String) {
        name = newName
    }
    func galleryName() -> String {
        name
    }
    func imageAndRatioTuple(at index: Int) -> (image: URL, ratio: Float) {
        (image: images[index], ratio: ratio[index])
    }
    func removeImageData(at index: Int) {
        images.remove(at: index)
        ratio.remove(at: index)
    }
}
