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
    
    func configure(with imageURL: URL) {
        for subview in cellView.subviews {
            if subview as? UIActivityIndicatorView != nil {
                continue
            }
            subview.removeFromSuperview()
        }
        loadingSpinner.alpha = 1
        loadingSpinner.startAnimating()
        DispatchQueue.global(qos: .userInitiated).async {
            let urlContents = try? Data(contentsOf: imageURL)
            DispatchQueue.main.async {
                self.loadingSpinner.stopAnimating()
                let image = UIImage(data: urlContents!)
                let imageView = UIImageView(image: image)
                imageView.frame = self.cellView.frame
                self.cellView.addSubview(imageView)
            }
        }
    }
    func defaultCell() {
        self.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.borderWidth = CGFloat(3)
    }
}
