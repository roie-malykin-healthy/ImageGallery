//
//  ImageCollectionGalleryController.swift
//  ImageGallery
//
//  Created by Roie Malykin on 25/05/2022.
//

import UIKit

final class ImageCollectionGalleryController: UIViewController {
   
    @IBOutlet weak var ImageCollection: UICollectionView!
    
    var dataSource: UICollectionViewDataSource?
    var delegate: UICollectionViewDelegate?
    // Starting a drag to rearange Cells
    func dragInteraction(_ interaction: UIDragInteraction, itemsForBegginning session: UIDragSession) -> [UIDragItem] {
        var draggedList = [UIDragItem]()
        return draggedList
    }
    // Creatinh UIDragItems
    // 1)  let dragItem = UIDragItem(itemProvider: NSitemProvider(object: provider))
    // 2) dragItem.localObject: Any = someObject
    
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
