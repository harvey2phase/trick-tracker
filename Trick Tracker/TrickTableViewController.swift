//
//  TrickTableViewController.swift
//  Trick Tracker
//
//  Created by Harvey Wang on 2017-02-02.
//  Copyright © 2017 Harvey Wang. All rights reserved.
//

import UIKit

class TrickTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var tricks = [Trick]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleTricks() // load sample data
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    //MARK: Actions
    @IBAction func unwindToTrickList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? TrickViewController, trick = sourceViewController.trick {
            
        }
    }
    */
    
    //MARK: Private Methods
    
    private func loadSampleTricks() {
        
        let p1 = UIImage(named: "kickflip")
        let p2 = UIImage(named: "hardflip")
        let p3 = UIImage(named: "treflip")
        
        guard let t1 = Trick(name: "Kickflip", picture: p1, starNum: 5) else {
            fatalError("Unable to instantiate trick1")
        }
        guard let t2 = Trick(name: "Hardflip", picture: p2, starNum: 5) else {
            fatalError("Unable to instantiate trick2")
        }
        guard let t3 = Trick(name: "Treflip", picture: p3, starNum: 5) else {
            fatalError("Unable to instantiate trick3")
        }
        
        tricks += [t1, t2, t3]
    }
    



    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tricks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // table view cells are reused and should be dequeued using a cell identifier
        let cellIdentifier = "TrickTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TrickTableViewCell else {
            fatalError("The dequeued cell is not an instance of TrickTableViewCell")
        }
        
        // fetches appropriate trick for the data source layout
        let trick = tricks[indexPath.row]
        
        cell.nameLabel.text = trick.name
        cell.pictureImageView.image = trick.picture
        cell.starControl.starCount = trick.starNum
        
        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
