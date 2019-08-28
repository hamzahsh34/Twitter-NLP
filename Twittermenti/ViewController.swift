//
//  ViewController.swift
//  Twittermenti
//
//  Created by Hamzah Shahid on 2019-08-27.
//  Copyright © 2019 Hamzah Shahid. All rights reserved.
//

import UIKit
import SwifteriOS
import CoreML
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentimentLabel: UILabel!
    
    let sentimentClassifier = TweetSentimentClassifier()
    
    let swifter = Swifter(consumerKey: "47cSlx0Ui5kXKRP0H6yYkRjuv", consumerSecret: "zrgHiQmRhpZ0C6zde9Fpll4I21VROtFn2yuO68dQdLhTfc4xZ8")

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let prediction = try! sentimentClassifier.prediction(text: "@Apple")
        
        swifter.searchTweet(using: "@Apple", lang: "en", count: 100, tweetMode: .extended, success: { (results, metadata) in
            
            var tweets = [String]()
            
            for i in 0..<100 {
                // SwiftyJSON
                if let tweet = results[i]["full_text"].string {
                    tweets.append(tweet)
                }
            }
            
        }) { (error) in
            print(error)
        }
    }

    @IBAction func predictPressed(_ sender: Any) {
    
    
    }
    
}

