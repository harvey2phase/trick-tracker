//  TrickTracker - TrickTableViewController.swift

//  Created by Harvey Wang
//  Copyright © 2017 Harvey Wang. All rights reserved.

/*
 
 References:
 
 Title: Start Developing iOS Apps (Swift)
 Author: Apple Inc.
 Date: 2016-12-08
 Type: Source code
 Availability: https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/index.html#//apple_ref/doc/uid/TP40015214-CH2-SW1
 
*/

import UIKit
import os.log

class TrickTableViewController: UITableViewController {
    
    //MARK: Properties
    var tricks = [Trick]()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem
        
        if let savedTricks📁 = loadTricks📂() {
            tricks += savedTricks📁
        }
        else {
            // Load the sample data.
            loadSamepleTricks()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    // MARK: Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tricks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "TrickTableViewCell"
        
        // as? TrickTableViewCell attempts to downcast the returned object from the UITableViewCell class to the TrickTableViewCell class and returns an optional
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TrickTableViewCell else {
            fatalError("The dequeued cell is not an instance of TrickTableViewCell.")
        }
        
        // Fetch the appropriate trick for the data source layout.
        let trick = tricks[indexPath.row]

        cell.nameLabel.text = trick.name
        cell.photoImageView.image = trick.photo
        cell.ratingControl.rating = trick.rating

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tricks.remove(at: indexPath.row)
            saveTricks📁()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    
    // MARK: Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "AddItem":
            os_log("Adding a new trick.", log: OSLog.default, type: .debug)
            
        case "ShowDetail":
            guard let trickDetailViewController = segue.destination as? TrickViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedTrickCell = sender as? TrickTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedTrickCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedTrick = tricks[indexPath.row]
            trickDetailViewController.trick = selectedTrick
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    
    
    
    
    //MARK: Actions
    @IBAction func unwindToTrickList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? TrickViewController, let trick = sourceViewController.trick {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing trick.
                tricks[selectedIndexPath.row] = trick
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                // Add a new trick.
                let newIndexPath = IndexPath(row: tricks.count, section: 0)
                
                tricks.append(trick)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            
            // Save the tricks.
            saveTricks📁()
        }
    }
    
    
    
    //MARK: Private Methods
    private func loadSamepleTricks() {
        
        let photo1 = UIImage(named: "Back 180")
        
        guard let trick1 = Trick(name: "Back 180", photo: photo1, rating: 5) else {
            fatalError("Unable to instantiate trick1.")
        }
        
        tricks += [trick1]
    }
    
    private func saveTricks📁() {
        let isSuccessfulSace👍 = NSKeyedArchiver.archiveRootObject(tricks, toFile: Trick.ArchiveURL📁.path)
        
        if isSuccessfulSace👍 {
            os_log("Successfully saved 👍", log: OSLog.default, type: .debug)
        }
        else {
            os_log("Failed to save 👎", log: OSLog.default, type: .error)
        }
    }
    
    private func loadTricks📂() -> [Trick]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Trick.ArchiveURL📁.path) as? [Trick]
    }
}
