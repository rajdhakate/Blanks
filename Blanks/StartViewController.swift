//
//  StartViewController.swift
//  Blanks
//
//  Created by Raj Dhakate on 02/02/18.
//  Copyright © 2018 Dhakate Codes. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resumeButton: UIButton!
    
    private func setupView() {
        startButton.setCornerRadius()
        resumeButton.setCornerRadius()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let destination = segue.destination as! GameViewController
        if (segue.identifier?.elementsEqual("Start"))! {
            destination.levelNumber = 0
        } else if (segue.identifier?.elementsEqual("Resume"))! {
            destination.levelNumber = 3
        }
    }

}

extension UIButton {
    func setCornerRadius() {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}
