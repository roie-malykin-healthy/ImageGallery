//
//  ImageGalleryTableViewController.swift
//  ImageGallery
//
//  Created by Roie Malykin on 26/05/2022.
//
import UIKit
final class ImageGalleryTableViewController: UITableViewController, UITextFieldDelegate {
    // MARK: - Attributes
    // private var dataModel = ImageGalleryTableViewData()
    private var activeGalleries = [Gallery]()
    private var recentlyDeletedGalleris = [Gallery]()
    private var selectedGallery = Gallery(name: "DefaultGallery")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Data for demo
        activeGalleries.append(Gallery(name: "AA"))
        activeGalleries.append(Gallery(name: "bb"))
        activeGalleries.append(Gallery(name: "cc"))
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        // return dataModel.numberOfSections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0 :
            return activeGalleries.count
        case 1 :
            return recentlyDeletedGalleris.count
        default:
            return 0
        }
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "My Galleries"
        default:
            return "Recently Deleted"
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Custom cell currently not displaying text properly , dont forget to set it back on story board
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? MyTableViewCell
//        // Enbling TextField to get the proper title
//        // cell!.textField.setEditing(true, animation: true)
//        cell!.textField.text! = dataModel.titleFromIndexPath(ip: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        var properText: String
        switch indexPath.section {
        case 0:
            properText = activeGalleries[indexPath.row].galleryName()
        case 1:
            properText = recentlyDeletedGalleris[indexPath.row].galleryName()
        default:
            properText = "Bug text"
        }
        print(properText)
        cell.textLabel?.text = properText
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 { // Active Galleries
            performSegue(withIdentifier: "ShowThisGallery", sender: indexPath)
        }
    }
    @IBAction private func createAndAddNewGallery(_ sender: UIBarButtonItem) {
        // dataModel.createAndAddNewGallery(name: "Untitled")
        var activeGalleryNames = [String]()
        for galn in activeGalleries {
            activeGalleryNames.append(galn.galleryName())
        }
        activeGalleries.append(Gallery(name: "Untitled".madeUnique(withRespectTo: activeGalleryNames)))
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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ImageCollectionGalleryController {
            if segue.identifier == "ShowThisGallery", let indexPath = sender as? IndexPath {
                destination.gallery = activeGalleries[indexPath.row]
                destination.title = activeGalleries[indexPath.row].galleryName()
            }
        }
    }
    // MARK: - "Life Cycle"
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if splitViewController?.preferredDisplayMode != .primaryOverlay {
            splitViewController?.preferredDisplayMode = .primaryOverlay
        }
    }
}
