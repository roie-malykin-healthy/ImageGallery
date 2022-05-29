//
//  ImageGalleryTableViewController.swift
//  ImageGallery
//
//  Created by Roie Malykin on 26/05/2022.
//
import UIKit
final class ImageGalleryTableViewController: UITableViewController, UITextFieldDelegate {
    // MARK: - Attributes
    private var dataModel = ImageGalleryTableViewData()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Data for demo
        let galNames = ["as", "df"]
        let rdgNames = ["yy", "nn"]
        dataModel = ImageGalleryTableViewData(galleryNames: galNames, deletedGalleryNames: rdgNames)
        // Register new my custom cells
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MyCell")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return dataModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataModel .numOfRowsInSection(chosenSection: section)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Custom cell currently not displaying text properly , dont forget to set it back on story board
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? MyTableViewCell
//        // Enbling TextField to get the proper title
//        // cell!.textField.isEnabled = true
//        cell!.textField.text! = dataModel.titleFromIndexPath(ip: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as? UITableViewCell
        cell!.textLabel?.text = dataModel.titleFromIndexPath(ip: indexPath)
        return cell!
    }
    /// This method deselct my tableCell ater aditing
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    @IBAction private func addNewGallery(_ sender: UIBarButtonItem) {
        dataModel.addNewGalery()
        tableView.reloadData()
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            dataModel.deleteGallery(indexPath: indexPath)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - "Life Cycle"
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if splitViewController?.preferredDisplayMode != .primaryOverlay {
            splitViewController?.preferredDisplayMode = .primaryOverlay
        }
    }
}
