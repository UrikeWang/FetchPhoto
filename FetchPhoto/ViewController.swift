//
//  ViewController.swift
//  FetchPhoto
//
//  Created by 王育翎 on 2017/7/21.
//  Copyright © 2017年 王育翎. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var buttonBackgroundView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    
    func callGetPhoto() {
        
        let photoPicker: UIImagePickerController = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            
            photoPicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            photoPicker.allowsEditing = true
            photoPicker.delegate = self
            self.present(photoPicker, animated: true, completion: nil)
            
        }
    
    }
    
    private func photoPickerController(_ photoPicker: UIImagePickerController,  didFinishPickingMediaWithInfo info: [String: Any]) {
    
        photoPicker.dismiss(animated: true, completion: nil)
        self.photoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    func imagePickerControllerDidCancel(_ photoPicker: UIImagePickerController) {
        photoPicker.dismiss(animated: true, completion: nil)
    }
    
    func addPhotoButton(_ sender: UIButton) {
        
        self.callGetPhoto()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //button outlet
        addPhotoButton.backgroundColor = UIColor(red: 43.0/255.0, green: 43.0/255.0, blue: 43.0/255.0, alpha:1)
        addPhotoButton.layer.cornerRadius = 2
        addPhotoButton.layer.shadowColor = UIColor.black.cgColor
        addPhotoButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        addPhotoButton.addTarget(self, action: #selector(ViewController.addPhotoButton(_:)), for: UIControlEvents.touchUpInside)
//        addPhotoButton.addTarget(self, action:)
        
        
        
        //button background
        buttonBackgroundView.backgroundColor = UIColor(red: 249.0/255.0, green: 223.0/255.0, blue: 23.0/255.0, alpha:1)
        
        
        //photoImage
        photoImageView.frame = CGRect(x: self.view.frame.size.width / 4 / 2, y: 64, width: self.view.frame.size.width / 4 * 3, height: self.view.frame.size.height / 4 * 2)
        photoImageView.image = UIImage(named: "icon_photo")
        photoImageView.layer.backgroundColor = UIColor.black.cgColor
        photoImageView.tintColor = UIColor.white
//        photoImageView.contentMode = .scaleToFill
        
        
        self.view.addSubview(self.photoImageView)
//        self.view.addSubview(addPhotoButton)
        
    }

    

}

