//
//  SplashScreenViewController.swift
//  MakanMakanan
//
//  Created by Patrick Sinaga on 31/07/22.
//

import UIKit
import Lottie

class SplashScreenViewController: UIViewController {
    

    @IBOutlet var animationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpAnimation()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
            self.performSegue(withIdentifier: "OpenMenu", sender: nil)
            self.animationView.stop()
        }
    }
    
    private func setUpAnimation(){
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        animationView.play()
    }
    
}
