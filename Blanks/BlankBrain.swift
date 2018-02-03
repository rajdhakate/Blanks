//
//  BlankBrain.swift
//  Blanks
//
//  Created by Webdior Mac - 2 on 03/02/18.
//  Copyright © 2018 Dhakate Codes. All rights reserved.
//

import Foundation

class BlankBrain: NSObject {
    
    class func contentWithString(string: String) -> [String] {
        let range = string.range(of: string)
        var stringsArray = [String]()
        string.enumerateSubstrings(in: range!, options: .bySentences) { (subString, substringRange, enclosingRange, stop) in
//            let randomString = randomStringFromSentance(subString!)
            stringsArray.append(subString!)
        }
        return stringsArray
    }
    
    class func getScore() -> Int {
        return 0
    }
    
    private var score = Int()
    
    private func randomStringFromSentance(sentance: String) -> String {
        let sentanceInArray = sentance.components(separatedBy: " ")
        let randomIndex = Int(arc4random_uniform(UInt32(sentanceInArray.count)))
        return sentanceInArray[randomIndex]
    }
    
    private func checkContentForString(strings: [String]) {
        
    }
}
