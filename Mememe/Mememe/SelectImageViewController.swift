//
//  SelectImageViewController.swift
//  Mememe
//
//  Created by 尾山昌太郎 on 2018/12/28.
//  Copyright © 2018 shotaro. All rights reserved.
//

import UIKit

class SelectImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    
    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var textOnTop: UITextField!
    @IBOutlet weak var textOnBottom: UITextField!
    var textOnTopEditing: UInt = 0

    let memeTextAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.strokeColor: UIColor.white/* TODO: fill in appropriate UIColor */,
        NSAttributedString.Key.foregroundColor: UIColor.blue/* TODO: fill in appropriate UIColor */,
        NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSAttributedString.Key.strokeWidth: -3.0 /* TODO: fill in appropriate Float */
    ]
    
    struct Meme {
        var topText: String
        var bottomText: String
        var originalImage: UIImage
        var memedImage: UIImage
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // label
        
        textOnTop.defaultTextAttributes = memeTextAttributes
        textOnBottom.defaultTextAttributes = memeTextAttributes
        textOnTop.textAlignment = NSTextAlignment.center
        textOnBottom.textAlignment = NSTextAlignment.center
        self.textOnTop.delegate = self
        self.textOnBottom.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeToKeyboardNotifications()
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
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
    
    @objc func subscribeToKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    func unsubscribeFromKeyboardNotifications() {
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(_ notification:Notification) {
        if view.frame.origin.y == 0 {
            if textOnBottom.isEditing {
                view.frame.origin.y -= getKeyboardHeight(notification)
            }
        }
    }
    
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
    
    @objc func keyboardWillHide(_ notification:Notification) {
        if textOnBottom.isEditing {
            view.frame.origin.y += getKeyboardHeight(notification)
        }
    }
    
    func save() {
        // Create the meme
        let memedImage = generateMemedImage()
        let meme = Meme(topText: textOnTop.text!, bottomText: textOnBottom.text!, originalImage: imagePickerView.image!, memedImage: memedImage)
    }
    
    
    func generateMemedImage() -> UIImage {
        
        // TODO: Hide toolbar and navbar
        
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        // TODO: Show toolbar and navbar
        
        return memedImage
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
    
}

