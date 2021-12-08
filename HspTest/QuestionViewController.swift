//
//  ViewController.swift
//  HspTest
//
//  Created by Chia on 2021/12/07.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var questionIndex = 0 {
        // 當題號改變時自動更新畫面顯示的題號及題目內容
        didSet {
            questionNumberLabel.text = "\(questionIndex + 1)"
            questionLabel.text = questions[questionIndex]
        }
    }
    var totalScore = 0

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var questionNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restart()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        // 高敏感測驗的前35題是正分、後13題是負分
        // 已事先將每個選項會得到的分數設定到button的tag中
        if questionIndex < 35 {
            totalScore += sender.tag
        } else {
            totalScore -= sender.tag
        }
        // 判斷是否還有題目
        if questionIndex == (questions.count - 1) {
            performSegue(withIdentifier: "showResult", sender: nil)
            restart()
        } else {
            questionIndex += 1
        }
    }
    
    @IBSegueAction func showResult(_ coder: NSCoder) -> ResultViewController? {
        return ResultViewController(coder: coder, score: totalScore)
    }
    
    func restart() {
        questionIndex = 0
        totalScore = 0
    }
    
}

