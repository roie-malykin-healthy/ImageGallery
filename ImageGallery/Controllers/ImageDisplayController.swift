//
//  ImageDisplayController.swift
//  ImageGallery
//
//  Created by Roie Malykin on 24/05/2022.
import UIKit
/// This controller Displays the selected Image from galery via a scrollView ,Based on CS193 Stanford course code.
final class ImageDisplayController: UIViewController, UIScrollViewDelegate {
    // MARK: - Attributes
    private var imageURL: URL? {
        didSet {
            image = nil
            if view.window != nil {
               fetchImage()
            }
        }
    }
    private var imageView = UIImageView()
    
    private var image: UIImage? {
        get { imageView.image }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
    }
    @IBOutlet private weak var loadingSpinner: UIActivityIndicatorView!
    // MARK: - ScrollView outlet
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
            loadingSpinner.startAnimating()
            DispatchQueue.global(qos: .userInitiated).async {[weak self] in
                let urlContents = try? Data(contentsOf: url) // Try because Data(contentsOf:) throws!
                DispatchQueue.main.async {
                    self!.loadingSpinner.stopAnimating()
                    self!.loadingSpinner.isHidden = true
                    if let imageData = urlContents, self?.imageURL == url {
                        self?.image = UIImage(data: imageData)
                    }
                }
            }
        }
    }

    // MARK: - View life cycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
           fetchImage()
        }
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
