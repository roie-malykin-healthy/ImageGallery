//
//  GalleryTable.swift
//  ImageGallery
//
//  Created by Roie Malykin on 25/05/2022.
//
import Foundation
import UIKit
final class GaleryTableData: UITableViewDataSource {
    
    // MARK: - Attributes
    private(set) var galleryNames: [String]
    private(set) var deletedGalleryNames: [String]
    let numberOfSections: Int = 2
    // MARK: - Initilizers
    init() {
        self.galleryNames = [String]()
        self.deletedGalleryNames = [String]()
    }
    init( galleryNames: [String] ,deletedGalleryNames: [String] ) {
        self.galleryNames = galleryNames
        self.deletedGalleryNames = deletedGalleryNames
    }
    // MARK: - Methods
    private func addGalery(galleryName: String, indexOfGallery: Int) {
        galleryNames.append(galleryName)
    }
    private func moveGallerytoRecentlyDeleted(galleryName: String, indexOfGallery: Int) {
            assert(galleryName == galleryNames[indexOfGallery], "Gallery name dosent match ")
    }
    
    
    // MARK: - Inherited methods from UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return galleryNames.count
        case 2:
            return deletedGalleryNames.count
        default:
            return 0
        }
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
