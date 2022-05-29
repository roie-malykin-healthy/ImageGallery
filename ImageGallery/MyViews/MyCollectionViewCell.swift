//
//  MyCollectionViewCell.swift
//  ImageGallery
//
//  Created by Roie Malykin on 29/05/2022.
//

import UIKit
/// This class is a cell containing the image to be displayd if pressed
final class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var cellView: UIView!
    @IBOutlet private weak var loadingSpinner: UIActivityIndicatorView!
    
    func myMainView() -> UIView {
        cellView
    }
}
