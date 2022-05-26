//
//  ImageCollectionModel.swift
//  ImageGallery
//
//  Created by Roie Malykin on 25/05/2022.
//
import Foundation
import UIKit
final class ImageCollectionModel : UICollectionViewDataSource {
    // MARK: - Attributes
    private var name: String = "MyDefalutName"
    private var width: Float = 100.0
    private var images = [ImageCell]()
    init(name: String ,width: Float) {
        self.name = name
        self.width = width
    }
    // MARK: -
    func changeGalleryName(newName: String) {
        name = newName
    }
    func addImageCellToGallery(newImageCell: ImageCell) {
        images.append(newImageCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // For multhy thread safty we need to decide does this the image still relevant or our the user scrolled away and its gone, so we wont show this cell
        // let prototype = decision ? "cell 1" : "cell 2"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: <#T##String#>, for: <#T##IndexPath#>)
    }
    
    func isEqual(_ object: Any?) -> Bool {
        <#code#>
    }
    
    var hash: Int
    
    var superclass: AnyClass?
    
    func `self`() -> Self {
        <#code#>
    }
    
    func perform(_ aSelector: Selector!) -> Unmanaged<AnyObject>! {
        <#code#>
    }
    
    func perform(_ aSelector: Selector!, with object: Any!) -> Unmanaged<AnyObject>! {
        <#code#>
    }
    
    func perform(_ aSelector: Selector!, with object1: Any!, with object2: Any!) -> Unmanaged<AnyObject>! {
        <#code#>
    }
    
    func isProxy() -> Bool {
        <#code#>
    }
    
    func isKind(of aClass: AnyClass) -> Bool {
        <#code#>
    }
    
    func isMember(of aClass: AnyClass) -> Bool {
        <#code#>
    }
    
    func conforms(to aProtocol: Protocol) -> Bool {
        <#code#>
    }
    
    func responds(to aSelector: Selector!) -> Bool {
        <#code#>
    }
    
    var description: String
}
