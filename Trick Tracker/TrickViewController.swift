//  TrickViewController.swift - Trick Tracker

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

class TrickViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    //MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var starControl: StarControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    var trick: Trick?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // handle the text field's user input through dlegate callbacks
        nameTextField.delegate = self
    }

    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dimiss keyboard
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    
    //MARK: UImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil) // dismiss picker if cancelled
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // the info dictionary may contain multiple representations of the image; want the original
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided with the following: \(info)")
        }
        
        imageView.image = selectedImage // set imageView to display image
        
        dismiss(animated: true, completion: nil) // dismiss picker
        
    }
    
    
    //MARK: Navigation
    
    // configure a view controller before it's presented
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // configure destination view controller <=> save button is pressed
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = nameTextField.text ?? ""
        let picture = imageView.image
        let starCount = starControl.starCount
        
        // set trick to be passed to TrickTableViewController after the unwind segue
        trick = Trick(name: name, picture: picture, starNum: starCount)
        
        
    }
    
    
    //MARK: Actions
    
    @IBAction func selectPhotoFromLibrary(_ sender: UITapGestureRecognizer) {
        
        nameTextField.resignFirstResponder() // dismiss keyboard
        
        // UIImagePickerController => a view controller that lets users pick media from photo library
        let imagePickerController = UIImagePickerController()
        
        // allows photo to be picked, not taken
        imagePickerController.sourceType = .photoLibrary
        
        // notifies ViewController when an image is picked
        imagePickerController.delegate = self
        present (imagePickerController, animated: true, completion: nil)
    }
}
