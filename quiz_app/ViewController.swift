//
//  ViewController.swift
//  quiz_app
//
//  Created by Devontae Reid on 1/24/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var currentQuestionLabel: UILabel!
    @IBOutlet weak var nextQuestionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    var currentIndex = 0;
    
    let questions:[Question] = [Question(question:"What programming language is this application written in?",answer:"SWIFT"),Question(question:"What the capital of Idaho?",answer:"Boise"),Question(question:"Who is the quarterback of the Los Angeles Rams?",answer:"Jared Goff")]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.currentQuestionLabel.text = questions[currentIndex].question
        self.answerLabel.text = "???"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.nextQuestionLabel.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextQuestion(_ sender: Any) {
        currentIndex += 1
        if currentIndex >= questions.count {
            currentIndex = 0
        }
        
        self.nextQuestionLabel.text = questions[currentIndex].question
        self.answerLabel.text = "???"
        
        animateLabelTransition()
    }
    
    
    @IBAction func showAnswer(_ sender: Any) {
        self.answerLabel.text = questions[currentIndex].answer
    }
    
    // MARK: - Animations -
    func animateLabelTransition() {
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [],
                       animations: {
                        self.currentQuestionLabel.alpha = 0
                        self.nextQuestionLabel.alpha = 1
        }) { _ in
            swap(&self.currentQuestionLabel,
                 &self.nextQuestionLabel)
        }
    }
    
}

