//
//  ViewController.swift
//  FlagGame
//
//  Created by user163948 on 3/29/20.
//  Copyright © 2020 lecosas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    //MARK: - Properties
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var qtyQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        askQuestion()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(showScore))
    }

    //MARK: - Methods
    func askQuestion(action: UIAlertAction! = nil) {
        qtyQuestions += 1
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased() + " - Score: \(score)"
    }
    
    @objc func showScore() {
        let ac = UIAlertController(title: "Score", message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Back", style: .default, handler: nil))
        present(ac, animated: true)
    }
    
    //MARK: - Actions
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String = ""
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Incorrect"
            message = "Wrong! That’s the flag of \(countries[correctAnswer].uppercased()).\n"
            score -= 1
        }
        
        message += "Your score is \(score)"
        
        if qtyQuestions == 10 {
            qtyQuestions = 0
            score = 0
            title += " - Game over"
            message += "\n The game is going to be restarted"
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    

}

