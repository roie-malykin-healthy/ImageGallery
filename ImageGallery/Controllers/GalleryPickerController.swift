//
//  GalleryPickerController.swift
//  ImageGallery
//
//  Created by Roie Malykin on 25/05/2022.
//

import UIKit

final class GalleryPickerController: UIViewController {
   // MARK: - Attributes
    private var tableData = GaleryTableData()
    @IBOutlet private weak var galleryTable: UITableView!
    private var dataSource: UITableViewDataSource?
    private var delegate: UITableViewDelegate?
   // MARK: - TableView methods
    private func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.numberOfSections
    }
    private func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.tableView(tableView, numberOfRowsInSection: section)
    }
    private func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = galleryTable .dequeueReusableCell(withIdentifier: "GalleryTableCell", for: indexPath)
        // Configure the cell
        cell.textLabel?.text = tableData.titleFromIndexPath(indexPath: indexPath)
        return cell
    }
    
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
