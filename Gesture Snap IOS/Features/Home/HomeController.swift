//
//  ViewController.swift
//  Gesture Snap
//
//  Created by Admin on 28/10/25.
//

import UIKit

class HomeController: BaseViewController {

    @IBOutlet weak var imgLogo: UIImageView!

    override func setupDefaultAppearance() {
        imgLogo.layer.cornerRadius = imgLogo.bounds.height / 2
    }
}

