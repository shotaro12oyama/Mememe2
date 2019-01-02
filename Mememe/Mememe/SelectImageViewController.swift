//
//  SelectImageViewController.swift
//  Mememe
//
//  Created by 尾山昌太郎 on 2018/12/28.
//  Copyright © 2018 shotaro. All rights reserved.
//

import UIKit

class SelectImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var textOnTop: UITextField!
    @IBOutlet weak var textOnBottom: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // label
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    }

    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        // To show photo from Camera library
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
        
        
    }
    
    @IBAction func pickAnImageFromAlbum(_ sender: Any) {
        // To show photo from photo album
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
       
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.editedImage] as? UIImage {
            
            // Set the image selected
            imagePickerView.contentMode = .scaleAspectFit
            imagePickerView.image = image
           
        }
        
        // モーダルビューを閉じる
        self.dismiss(animated: true, completion: nil)
    }

    @objc func keyboardWillShow(
    
    
}

