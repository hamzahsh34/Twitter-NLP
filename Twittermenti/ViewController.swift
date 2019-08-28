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
        
        swifter.searchTweet(using: "@Apple", lang: "en", count: 100, tweetMode: .extended, success: { (results, metadata) in
            
            var tweets = [TweetSentimentClassifierInput]()
            
            for i in 0..<100 {
                // SwiftyJSON
                if let tweet = results[i]["full_text"].string {
                    let tweetForClassifier = TweetSentimentClassifierInput(text: tweet)
                    tweets.append(tweetForClassifier)
                }
            }
            
            do {
                
                let predictions = try self.sentimentClassifier.predictions(inputs: tweets)
                var sentimentScore = 0
                
                for pred in predictions {
                    let sentiment = pred.label
                    if sentiment == "Pos" {
                        sentimentScore += 1
                    } else if sentiment == "Neg" {
                        sentimentScore -= 1
                    }
                }
                
            } catch {
                print(error)
            }
            
            
        }) { (error) in
            print(error)
        }
    }

    @IBAction func predictPressed(_ sender: Any) {
    
    
    }
    
}

