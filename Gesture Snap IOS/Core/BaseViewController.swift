//
//  BaseViewController.swift
//  Gesture Snap
//
//  Created by Admin on 29/10/25.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefaultAppearance()
    }

    func setupDefaultAppearance() {
        fatalError("Must override setupDefaultAppearance() in subclass")
    }
    
    func changeRootViewController(to viewController: UIViewController, duration: TimeInterval = 0.3) {
        guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
        window.rootViewController = viewController
        
        UIView.transition(
            with: window, duration: duration, options: .transitionCrossDissolve, animations: nil, completion: nil
        )
    }
    
    func navigateTo(storyboardName: String, viewControllerID: String? = nil, bundle: Bundle? = nil) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        
        let nextVC: UIViewController
        
        if let id = viewControllerID {
            nextVC = storyboard.instantiateViewController(withIdentifier: id)
        } else {
            guard let initialVC = storyboard.instantiateInitialViewController() else {
                fatalError("No Initial View Controller for '\(storyboardName)' Storybard.")
            }
            nextVC = initialVC
        }
        
        changeRootViewController(to: nextVC)
    }
}
