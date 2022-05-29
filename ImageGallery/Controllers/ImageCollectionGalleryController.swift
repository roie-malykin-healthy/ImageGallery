//
//  ImageCollectionGalleryController.swift
//  ImageGallery
//
//  Created by Roie Malykin on 25/05/2022.
//

import UIKit

final class ImageCollectionGalleryController: UIViewController, UICollectionViewDropDelegate {
    @IBOutlet private weak var dropZoneView: UIView!
    @IBOutlet private weak var imageCollection: UICollectionView!
    var dataSource: UICollectionViewDataSource?
    var delegate: UICollectionViewDelegate?
    
    //MARK: Drag interactions
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        <#code#>
        
    }
    // Starting a drag to rearange Cells
    func dragInteraction(_ interaction: UIDragInteraction, itemsForBegginning session: UIDragSession) -> [UIDragItem] {
        var draggedList = [UIDragItem]()
        return draggedList
    }
    // Creating UIDragItems
    // 1)  let dragItem = UIDragItem(itemProvider: NSitemProvider(object: provider))
    // 2) dragItem.localObject: Any = someObject
    // MARK: - UIDropInteractionDelegate

    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSURL.self) && session.canLoadObjects(ofClass: UIImage.self)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    var imageFetcher: ImageFetcher!
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        imageFetcher = ImageFetcher() { (url, image) in
            DispatchQueue.main.async {
                self.emojiArtBackgroundImage = image
            }
        }
        
        session.loadObjects(ofClass: NSURL.self) { nsurls in
            if let url = nsurls.first as? URL {
                self.imageFetcher.fetch(url)
            }
        }
        session.loadObjects(ofClass: UIImage.self) { images in
            if let image = images.first as? UIImage {
                self.imageFetcher.backup = image
            }
        }
    
    
    
    // MARK: - Life cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Drop action config
           //   let dropInteraction = UIDropInteraction(delegate: <#T##UIDropInteractionDelegate#>)
           // dropZoneView.addInteraction(dropInteraction)
           
           // Do any additional setup after loading the view.

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
