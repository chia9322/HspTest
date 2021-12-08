//
//  ResultViewController.swift
//  HspTest
//
//  Created by Chia on 2021/12/07.
//

import UIKit

class ResultViewController: UIViewController {
    
    var score: Int
    
    init?(coder: NSCoder, score: Int) {
        self.score = score
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "\(score)"
        if score >= 60 {
            resultLabel.text = "高敏感族群"
        } else {
            resultLabel.text = "低敏感族群"
        }
    }
}
