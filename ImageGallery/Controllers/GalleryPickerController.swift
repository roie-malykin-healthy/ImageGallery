//
//  GalleryPickerController.swift
//  ImageGallery
//
//  Created by Roie Malykin on 25/05/2022.
//

import UIKit

final class GalleryPickerController: UIViewController {
   // MARK: - Attributes
    @IBOutlet weak var galleryTable: UITableView!
    private var dataSource: UITableViewDataSource?
    private var delegate: UITableViewDelegate?
   // MARK: - TableView methods
    
   // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
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
