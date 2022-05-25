//
//  ImageDisplayController.swift
//  ImageGallery
//
//  Created by Roie Malykin on 24/05/2022.
//
import UIKit
final class ImageDisplayController: UIViewController, UIScrollViewDelegate {
    // MARK: - Attributes
    private var imageURL: URL? {
        didSet {
            imageView.image
        }
    }
    private var imageView = UIImageView()
    
    private var image: UIImage? {
            imageView.image
    }
    // MARK: - ScrollView outlets
    @IBOutlet private weak var scrollView: UIScrollView! {
        didSet {
            scrollView.maximumZoomScale = 1.2
            scrollView.minimumZoomScale = 1 / 25
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }
    private func fetchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url) // Cause data contentsOf throws
            if let imageData = urlContents {
                imageView.image = UIImage(data: imageData)
            }
        }
    }
    // MARK: - View life cycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
