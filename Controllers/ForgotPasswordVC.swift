//
//  ForgotPasswordVC.swift
//  uia
//
//  Created by EMPULSE on 20/09/23.
//

import UIKit

class ForgotPasswordVC: UIViewController {
    var gifLoader: GIFLoader?
    override func viewDidLoad() {
        super.viewDidLoad()
/// Create the semi-transparent background view
        let backgroundView = UIView(frame: UIScreen.main.bounds)
        backgroundView.backgroundColor = UIColor.clear
        self.view.addSubview(backgroundView)

        // Create and add the GIFLoader to the background view
        gifLoader = GIFLoader(frame: CGRect(x: 0, y: 0, width: 100, height: 100), gifName: "tools-7049_256")
        backgroundView.addSubview(gifLoader!)
        gifLoader!.center = backgroundView.center

        // Start animation
        gifLoader!.startAnimating()
        backgroundView.isUserInteractionEnabled = true
        // Simulate a delay, and then remove the loader
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.gifLoader?.removeFromSuperview()
            backgroundView.isUserInteractionEnabled = false
        }
        setUI()
    }
    
    func setUI(){
        view.applyLinearGradient(hexColors: linearColorArray)
    }
    @IBAction func click(_ sender: UIButton){
        print("is clicked")
    }

}
