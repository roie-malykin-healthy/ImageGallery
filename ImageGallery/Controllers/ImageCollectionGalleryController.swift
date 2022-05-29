//
//  ImageCollectionGalleryController.swift
//  ImageGallery
//
//  Created by Roie Malykin on 25/05/2022.
//
//
import UIKit
final class ImageCollectionGalleryController: UIViewController, UICollectionViewDataSource,
                                              UICollectionViewDropDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDragDelegate {
    // MARK: - Attributes
    var gallery: Gallery!
    
    // private var galleryData: ImageCollectionModel?
    @IBOutlet private weak var dropZoneView: UIView!
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    lazy var dataSource: UICollectionViewDataSource = self
    lazy var delegate: UICollectionViewDelegate = self
    // MARK: Drag interactions
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        dragItems(at: indexPath)
    }
    private func dragItems(at indexPath: IndexPath) -> [UIDragItem] {
        if indexPath.item < (self.gallery?.images.count)! {
            if let cell = collectionView.cellForItem(at: indexPath) as? MyCollectionViewCell {
                if let image = (cell.myMainView().subviews[1] as? UIImageView)?.image {
                    let dragItem = UIDragItem(itemProvider: NSItemProvider(object: image))
                    dragItem.localObject = gallery.imageAndRatioTuple(at: indexPath.item)
                    return [dragItem]
                }
            }
        }
        return []
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        print("place holder print")
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
        session.canLoadObjects(ofClass: NSURL.self) && session.canLoadObjects(ofClass: UIImage.self)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        UIDropProposal(operation: .copy)
    }
    
    var imageFetcher: ImageFetcher!
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
    }
    
    //        session.loadObjects(ofClass: NSURL.self) { nsurls in
    //            if let url = nsurls.first as? URL {
    //                self.imageFetcher.fetch(url)
    //            }
    //        }
    //        session.loadObjects(ofClass: UIImage.self) { images in
    //            if let image = images.first as? UIImage {
    //                self.imageFetcher.backup = image
    //            }
    //        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)
        if let myCell = cell as? MyCollectionViewCell {
            print("put image into cell")
        }
        return cell
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
