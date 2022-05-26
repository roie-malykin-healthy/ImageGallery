//
//  GalleryTable.swift
//  ImageGallery
//
//  Created by Roie Malykin on 25/05/2022.
//
import Foundation
import UIKit
final class GalleryTable: UITableViewDataSource {
    
    // MARK: - Attributes
    private var galleryNames: [String]
    private var deletedGalleryNames: [String]
   
    // MARK: - Methods
    init( galleryNames: [String] ,deletedGalleryNames: [String] ) {
        self.galleryNames = galleryNames
        self.deletedGalleryNames = deletedGalleryNames
    }
    
    private func addGalery(galleryName: String, indexOfGallery: Int) {
        galleryNames.append(galleryName)
    }
    private func moveGallerytoRecentlyDeleted(galleryName: String, indexOfGallery: Int) {
            assert(galleryName == galleryNames[indexOfGallery], "Gallery name dosent match ")
    }
    
    
    // MARK: - Inherited methods from UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // The "calssic" first row
        let cell = tableView.dequeueReusableCell(withIdentifier: <#T##String#>, for: <#T##IndexPath#>) // This reuses UITVCell with the given identifier if possible
        // cell.textLabel?.text =
//        if let myTVCell  = cell as? UITableViewCell {
//            myTVCell.
//        }
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
