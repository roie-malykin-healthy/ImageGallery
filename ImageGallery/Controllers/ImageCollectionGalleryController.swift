//
//  ImageCollectionGalleryController.swift
//  ImageGallery
//
//  Created by Roie Malykin on 25/05/2022.
//
//
import UIKit
final class ImageCollectionGalleryController: UIViewController, UICollectionViewDataSource, UIDropInteractionDelegate, UICollectionViewDropDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDragDelegate {
    // MARK: - Attributes
    var gallery: Gallery!
    var imageFetcher: ImageFetcher!
    
    // private var galleryData: ImageCollectionModel?
    @IBOutlet private weak var dropZoneView: UIView!
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.dropDelegate = self
            collectionView.dragDelegate = self
            // collectionView.collectionViewLayout as UICollectionViewFlowLayout
        }
    }
     lazy var dataSource: UICollectionViewDataSource = self
     lazy var delegate: UICollectionViewDelegate = self
    // MARK: - UICollectionView SetUp
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? MyCollectionViewCell {
            if gallery != nil, indexPath.item < ((gallery?.images.count)!) {
                imageCell.configure(with: ((gallery?.images[indexPath.item])!)!)
            } else {
                imageCell.defaultCell()
            }
            cell = imageCell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item < (gallery?.images.count) ?? 0 {
            performSegue(withIdentifier: "PresentChosenImage", sender: indexPath)
        }
    }
    // MARK: Drag interactions
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        dragItems(at: indexPath)
    }
    private func dragItems(at indexPath: IndexPath) -> [UIDragItem] {
        if indexPath.item < (self.gallery?.images.count)! {
            if let cell = collectionView.cellForItem(at: indexPath) as? MyCollectionViewCell {
                if let image = (cell.myMainView().subviews[ 1] as? UIImageView)?.image {
                    let dragItem = UIDragItem(itemProvider: NSItemProvider(object: image))
                    dragItem.localObject = gallery.imageAndRatioTuple(at: indexPath.item)
                    return [dragItem]
                }
            }
        }
        return []
    }
    
    // MARK: - UIUICollectionViewDropDelegate
    /// There are two way to call this method , either droping a new image , and then it goes to the end of the collection , or rearrangeDrop , and swich places
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        // Detirmine destination, default to the end of the collection , or to a specefied index
        let destinationIndexPath = coordinator.destinationIndexPath ?? IndexPath(item: gallery.images.endIndex, section: 0)
        for item in coordinator.items {
            if let sourceIndexPath = item.sourceIndexPath { // This is rearrange drop.
                if let (url, ratio) = item.dragItem.localObject as? (URL, Float) {
                    collectionView.performBatchUpdates({ gallery.removeImageData(at: sourceIndexPath.item)
                        gallery?.images.insert(contentsOf: [url], at: destinationIndexPath.item)
                        gallery?.ratio.insert(contentsOf: [ratio], at: destinationIndexPath.item)
                        collectionView.deleteItems(at: [sourceIndexPath])
                        collectionView.insertItems(at: [destinationIndexPath]) })
                    coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
                }
            } else { // This is drop new image
                let placeholderContext = coordinator.drop(item.dragItem, to: UICollectionViewDropPlaceholder(insertionIndexPath: destinationIndexPath, reuseIdentifier: "ImageCell"))
                item.dragItem.itemProvider.loadObject(ofClass: UIImage.self) { (provider, _ ) in
                    DispatchQueue.main.async {
                        if let url = provider as? URL {
                            placeholderContext.commitInsertion(dataSourceUpdates: { insertionIndexPath in
                                self.gallery?.images.insert(contentsOf: [url], at: insertionIndexPath.item)
                                collectionView.reloadData()
                            })
                        } else {
                            placeholderContext.deletePlaceholder()
                        }
                    }
                }
            }
        }
    }
    // MARK: - UIDropInteractionDelegate
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        session.canLoadObjects(ofClass: NSURL.self) && session.canLoadObjects(ofClass: UIImage.self)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        UIDropProposal(operation: .copy)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        session.loadObjects(ofClass: NSURL.self) { nsurls in
            if let url = nsurls.first as? URL {
                let urlContents = try? Data(contentsOf: url)
                if let imageFromURL = UIImage(data: urlContents!) {
                    let ratio = Float(imageFromURL.size.width) / Float(imageFromURL.size.height)
                    self.gallery?.images.append(url)
                    self.gallery?.ratio.append(ratio)
                    self.collectionView.reloadData()
                } else {
                    return
                }
            }
        }
    }
    
    // MARK: - Life cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.dragDelegate = self
        collectionView?.dropDelegate = self
        collectionView.addInteraction(UIDropInteraction(delegate: self))
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let destination = segue.destination as? ImageDisplayController {
             if segue.identifier == "PresentChosenImage", let indexPath = sender as? IndexPath {
                 destination.imageURL = gallery.images[indexPath.item]
             }
         }
     }
}
