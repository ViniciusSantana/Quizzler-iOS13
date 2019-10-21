//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var option1Button: UIButton!
    
    @IBOutlet weak var option2Button: UIButton!
    
    @IBOutlet weak var option3Button: UIButton!
    
    var quizBrain = QuizBrain()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        sender.layer.cornerRadius = 0.3 * sender.bounds.size.height
        
        let userAnswer = sender.currentTitle!
        let isAnswerCorrect = quizBrain.checkAnswer(userAnswer)
       
        
        if isAnswerCorrect {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
    
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { timer in
            self.updateUI()
        }
        
    }
    
    func updateUI(){
        let completionPercent = quizBrain.getCompletionProgress()
        let options = quizBrain.getQuestionAnswers()
        questionLabel.text =  quizBrain.getQuestionText()
        option1Button.backgroundColor = UIColor.clear
        option2Button.backgroundColor = UIColor.clear
        option3Button.backgroundColor = UIColor.clear
        progressView.setProgress(completionPercent, animated: true)
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        option1Button.setTitle(options[0], for: .normal)
        option2Button.setTitle(options[1], for: .normal)
        option3Button.setTitle(options[2], for: .normal)
        
    }
    
}

