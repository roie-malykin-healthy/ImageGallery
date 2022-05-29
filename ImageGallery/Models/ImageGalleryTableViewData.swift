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
    private(set) var activeGalleries: [Gallery]
    private(set) var recentlyDeletedGalleris: [Gallery]
    let numberOfSections: Int = 2
    // MARK: - Initilizers
    init() {
        self.activeGalleries = [Gallery]()
        self.recentlyDeletedGalleris = [Gallery]()
    }
    init( activeGalleries: [Gallery], recentlyDeletedGalleris: [Gallery] ) {
        self.activeGalleries = recentlyDeletedGalleris
        self.recentlyDeletedGalleris = recentlyDeletedGalleris
    }
    // MARK: - Methods
    private func moveGalleryIntoRecentlyDeleted(indexPath: IndexPath) {
        let galleryToMove = activeGalleries.remove(at: indexPath.row)
        recentlyDeletedGalleris.append(galleryToMove)
    }
    private func completlyRemoveGallery(indexPath: IndexPath) {
    }
    
    // MARK: - Methods for controller
    func createAndAddNewGallery(name: String) {
        let newGallery = Gallery(name: name)
        activeGalleries.append(newGallery)
    }
    func addGallery(gal: Gallery) {
        activeGalleries.append(gal)
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
            return activeGalleries.count
        case 1 :
            return recentlyDeletedGalleris.count
        default:
            return 0
        }
    }
    func titleFromIndexPath (ip: IndexPath) -> String {
        assert(ip.section < 2, "GaleryTableData.titleFromIndexPath(\(ip)) , the selected section does not exist! given section : \(ip.section)")
        switch ip.section {
        case 0:
            assert(ip.row < activeGalleries.count, "GaleryTableData.titleFromIndexPath(\(ip)) , the selected gallery name does not exist! given row : \(ip.row)")
            return activeGalleries[ip.row].name
        case 1:
            assert(ip.row < recentlyDeletedGalleris.count, "GaleryTableData.titleFromIndexPath(\(ip)) , the selected deleted gallery name does not exist in recently ! given row : \(ip.row)")
            return recentlyDeletedGalleris[ip.row].name
        default:
            return "Bug text!"
        }
    }
}
