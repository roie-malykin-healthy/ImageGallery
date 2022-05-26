//
//  ImageGalleryTableViewData.swift
//  ImageGallery
//
//  Created by Roie Malykin on 26/05/2022.
//

import Foundation
/// This class is tied with ImageGalleryTableViewController , and act as its model , this version !!!does not inherit!!!  UITableViewData source.
final class ImageGalleryTableViewData {
    // MARK: - Attributes
    private(set) var galleryNames: [String]
    private(set) var deletedGalleryNames: [String]
    let numberOfSections: Int = 2
    // MARK: - Initilizers
    init() {
        self.galleryNames = [String]()
        self.deletedGalleryNames = [String]()
    }
    init( galleryNames: [String], deletedGalleryNames: [String] ) {
        self.galleryNames = galleryNames
        self.deletedGalleryNames = deletedGalleryNames
    }
    // MARK: - Methods
    
    private func moveGalleryIntoRecentlyDeleted(indexPath: IndexPath) {
        let galleryToMove = galleryNames.remove(at: indexPath.row)
        deletedGalleryNames += [ galleryToMove.madeUnique(withRespectTo: deletedGalleryNames)]
    }
    private func completlyRemoveGallery(indexPath: IndexPath) {
    }
    
    // MARK: - Methods for controller
    func addNewGalery() {
        galleryNames += ["Untiteled".madeUnique(withRespectTo: galleryNames)]
    }

    func deleteGallery(indexPath: IndexPath) {
    switch indexPath.section {
    case 0 :
        moveGalleryIntoRecentlyDeleted(indexPath: indexPath)
    case 1 :
        completlyRemoveGallery(indexPath: indexPath)
    default:
        print("no section here")
        }
    }

    func numOfRowsInSection(chosenSection: Int) -> Int {
        switch chosenSection {
        case 0 :
            return galleryNames.count
        case 1 :
            return deletedGalleryNames.count
        default:
            return 0
        }
    }
    func titleFromIndexPath (ip: IndexPath) -> String {
        assert(ip.section < 2, "GaleryTableData.titleFromIndexPath(\(ip)) , the selected section does not exist! given section : \(ip.section)")
        switch ip.section {
        case 0:
            assert(ip.row < galleryNames.count, "GaleryTableData.titleFromIndexPath(\(ip)) , the selected gallery name does not exist! given row : \(ip.row)")
            return galleryNames[ip.row]
        case 1:
            assert(ip.row < deletedGalleryNames.count, "GaleryTableData.titleFromIndexPath(\(ip)) , the selected deleted gallery name does not exist in recently ! given row : \(ip.row)")
            return deletedGalleryNames[ip.row]
        default:
            return "Bug text!"
        }
    }
}
