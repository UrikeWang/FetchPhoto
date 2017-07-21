//
//  ViewController.swift
//  FetchPhoto
//
//  Created by 王育翎 on 2017/7/21.
//  Copyright © 2017年 王育翎. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate {

    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var buttonBackgroundView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoScrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.toolbar.isTranslucent = true
        
 
        //button outlet
        addPhotoButton.backgroundColor = UIColor(red: 43.0/255.0, green: 43.0/255.0, blue: 43.0/255.0, alpha:1)
        addPhotoButton.layer.cornerRadius = 2
        addPhotoButton.layer.shadowColor = UIColor.black.cgColor
        addPhotoButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        addPhotoButton.setTitle("Pick an Image", for: .normal)
        addPhotoButton.titleLabel?.font = UIFont(name: ".SFUIText-Heavy", size: 20)
        addPhotoButton.setTitleColor(UIColor.white, for: .normal)
        addPhotoButton.addTarget(self, action: #selector(ViewController.addPhotoButton(_:)), for: UIControlEvents.touchUpInside)

        
        //button background
        buttonBackgroundView.backgroundColor = UIColor(red: 249.0/255.0, green: 223.0/255.0, blue: 23.0/255.0, alpha:1)
        
        
        //photoImage
//        photoImageView.image = UIImage(named: "icon_photo")
        photoImageView.layer.backgroundColor = UIColor.black.cgColor
        photoImageView.tintColor = UIColor.white
        photoImageView.contentMode = .center
//        photoImageView.contentMode = .scaleAspectFit

        
        print("00000000")
        
        //scroll view
        photoScrollView.layer.backgroundColor = UIColor.black.cgColor
        photoScrollView.minimumZoomScale = 0.1
        photoScrollView.maximumZoomScale = 5.0
        photoScrollView.zoomScale = 1.0  //很重要...
        
        photoScrollView.delegate = self
        photoScrollView.addSubview(photoImageView)

        
    }

    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    
        return self.photoImageView
    }
    

    func imagePickerController(_ picker: UIImagePickerController,  didFinishPickingMediaWithInfo info: [String: Any]) {
        
        picker.dismiss(animated: true, completion: nil) // 關掉
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            photoImageView.image = image
            photoImageView.contentMode = .scaleAspectFit
            
            
        } else{
            print("Something went wrong")
        }
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func addPhotoButton(_ sender: UIButton) {
        
        let picker: UIImagePickerController = UIImagePickerController()
        
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
//        picker.allowsEditing = true // 可對照片作編輯
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
        
        
    }

}

