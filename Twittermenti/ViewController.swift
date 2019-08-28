//
//  ViewController.swift
//  Twittermenti
//
//  Created by Hamzah Shahid on 2019-08-27.
//  Copyright © 2019 Hamzah Shahid. All rights reserved.
//

import UIKit
import SwifteriOS

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentimentLabel: UILabel!
    
    let swifter = Swifter(consumerKey: "47cSlx0Ui5kXKRP0H6yYkRjuv", consumerSecret: "zrgHiQmRhpZ0C6zde9Fpll4I21VROtFn2yuO68dQdLhTfc4xZ8")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        swifter.searchTweet(using: "@Apple", lang: "en", count: 100, tweetMode: .extended, success: { (results, metadata) in
            print(results)
        }) { (error) in
            print(error)
        }
    }

    @IBAction func predictPressed(_ sender: Any) {
    
    
    }
    
}

