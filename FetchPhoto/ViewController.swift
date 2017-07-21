//
//  ViewController.swift
//  FetchPhoto
//
//  Created by 王育翎 on 2017/7/21.
//  Copyright © 2017年 王育翎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var buttonBackgroundView: UIView!
    
    @IBAction func addPhotoButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //button outlet
        addPhotoButton.backgroundColor = UIColor(red: 43.0/255.0, green: 43.0/255.0, blue: 43.0/255.0, alpha:1)
        addPhotoButton.layer.cornerRadius = 2
        addPhotoButton.layer.shadowColor = UIColor.black.cgColor
        addPhotoButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        //button background
        buttonBackgroundView.backgroundColor = UIColor(red: 249.0/255.0, green: 223.0/255.0, blue: 23.0/255.0, alpha:1)
        
    }

    

}

