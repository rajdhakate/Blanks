//
//  WordsCell.swift
//  Blanks
//
//  Created by Webdior Mac - 2 on 03/02/18.
//  Copyright © 2018 Dhakate Codes. All rights reserved.
//

import UIKit

class WordsCell: UICollectionViewCell {
    @IBOutlet var wordLabel: UILabel!
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = self.frame.size.height/2
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 2
    }
}
