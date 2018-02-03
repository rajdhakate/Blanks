//
//  GameViewController.swift
//  Blanks
//
//  Created by Raj Dhakate on 02/02/18.
//  Copyright © 2018 Dhakate Codes. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UITextViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var levelNumber = Int()
    var testString = String()
    var stringsArray = [String]()
    
    @IBOutlet var levelLabel: UILabel!
    @IBOutlet var textview: UITextView!
    @IBOutlet var wordsViewHeight: NSLayoutConstraint!
    
    @IBOutlet var scorePopup: UIView!
    @IBOutlet var popupBG: UIView!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var disableViewBG: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testString = textview.text
        textview.delegate = self
        // Do any additional setup after loading the view.
        self.levelLabel.text = "Level \(levelNumber)"
        stringsArray = BlankBrain.contentWithString(string: textview.text)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        textview.setContentOffset(.zero, animated: false)
    }
    
    @IBAction func pauseButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonAction(_ sender: UIButton) {
        showScore(bool: true)
    }
    
    @IBAction func dismissPopupAction(_ sender: UIButton) {
        showScore(bool: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stringsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size: CGSize = stringsArray[indexPath.row].size(withAttributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20.0)])
        return CGSize(width: size.width + 45.0, height: collectionView.bounds.size.height - 20.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let wordCell = collectionView.dequeueReusableCell(withReuseIdentifier: "WordCell", for: indexPath) as! WordsCell
        wordCell.wordLabel.text = stringsArray[indexPath.item]
        return wordCell
    }
    
    private func showScore(bool: Bool) {
        if bool {
            scoreLabel.text = "\(BlankBrain.getScore())"
            scorePopup.center = self.view.center
            self.view.addSubview(scorePopup)
            scorePopup.transform = scorePopup.transform.scaledBy(x: 0.001, y: 0.001)
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
                
                self.popupBG.layer.shadowColor = UIColor.darkGray.cgColor
                self.popupBG.layer.shadowRadius = 30
                self.popupBG.layer.shadowOffset = CGSize(width: 0, height: 0)
                self.popupBG.layer.shadowOpacity = 1.0
                self.scorePopup.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
                
                self.disableViewBG.isHidden = false
                
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
                self.scorePopup.transform = self.scorePopup.transform.scaledBy(x: 0.001, y: 0.001)
            }, completion: { (finished : Bool) in
                if(finished) {
                    self.scorePopup.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
                    self.scorePopup.removeFromSuperview()
                    self.disableViewBG.isHidden = true
                }
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
