//
//  ImageCollectionModel.swift
//  ImageGallery
//
//  Created by Roie Malykin on 25/05/2022.
//
import UIKit
final class ImageCollectionModel {
    // MARK: - Attributes
    private var name: String = "MyDefalutName"
    private var width: Float = 100.0
    private var images = [ImageCell]()
    init(name: String, width: Float) {
        self.name = name
        self.width = width
    }
    // MARK: - Methods
    func changeGalleryName(newName: String) {
        name = newName
    }
    func addImageCellToGallery(newImageCell: ImageCell) {
        images.append(newImageCell)
    }
    // MARK: - UICollectionViewDataSource methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // For multhy thread safty we need to decide does this the image still relevant or our the user scrolled away and its gone, so we wont show this cell
        // let prototype = decision ? "cell 1" : "cell 2"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IGCollectionCell", for: indexPath)
      return cell
    }
}
