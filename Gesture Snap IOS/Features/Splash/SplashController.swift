//
//  SplashController.swift
//  Gesture Snap
//
//  Created by Admin on 29/10/25.
//

import UIKit

class SplashController: BaseViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var adsText: UILabel!
    @IBOutlet weak var loadingText: UILabel!
    
    var timer: Timer?
    
    let totalDutation: TimeInterval = 2.5
    let timeInterval: TimeInterval = 0.025
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleProgress()
    }
    
    override func setupDefaultAppearance() {
        progressBar.progress = 0.0
        adsText.applyPoppins(style: .bold, size: 14.0)
        loadingText.applyPoppins(style: .semibold, size: 14.0)
    }
    
    func handleProgress() {
        let totalTicks = Int(totalDutation / timeInterval)
        var currentTick = 0
        
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            
            currentTick += 1
            
            let progressValue = Float(currentTick) / Float(totalTicks)
            if (currentTick <= totalTicks) {
                self.progressBar.setProgress(progressValue, animated: true)
                let percentage = Int(progressValue * 100)
                self.loadingText.text = L10n.loadingD(percentage)
            } else {
                self.startNextScreen()
            }
        }
    }
    
    func startNextScreen() {
        timer?.invalidate()
        timer = nil
    
        self.progressBar.setProgress(1.0, animated: true)
        navigateTo(storyboardName: "Home")
    }
}

