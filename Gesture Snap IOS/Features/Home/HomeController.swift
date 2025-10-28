//
//  ViewController.swift
//  Gesture Snap
//
//  Created by Admin on 28/10/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgLogo.layer.cornerRadius = imgLogo.bounds.height / 2
    }


}

