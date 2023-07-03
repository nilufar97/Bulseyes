//
//  ViewController.swift
//  Bulseyes
//
//  Created by second-admin on 21/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var guessingLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var rulesLabel: UILabel!
    
    @IBOutlet weak var hitButton: UIButton!
    
    @IBOutlet weak var pinkView: UIView!
    let gameManager = GameManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        scoreLabel.layer.borderWidth = 3
        scoreLabel.layer.cornerRadius = 16
        scoreLabel.layer.borderColor = UIColor.white.cgColor
        
        roundLabel.layer.borderWidth = 3
        roundLabel.layer.cornerRadius = 8
        roundLabel.layer.borderColor = UIColor.white.cgColor
        
        // CALayer
        hitButton.layer.cornerRadius = 16
        hitButton.layer.borderWidth = 3
        hitButton.layer.borderColor = UIColor.white.cgColor
        hitButton.backgroundColor = UIColor(named: "Indigo")
        // UIView
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
//        pinkView.addGestureRecognizer(tapGesture)
//
//        let longPressTap = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressTap))
//        pinkView.addGestureRecognizer(longPressTap)
//
//
//
//        let thumbImage = UIImage(named: "Nub")
//        slider.setThumbImage(thumbImage, for: .normal)
//
//        rulesLabel.text = rulesLabel.text?.uppercased() // lowercased()
//        print("Ugaday chislp ", gameManager.guessingNumber)
        
        updateLabels()
    }
    
    
    
//    @objc func handleTap() {
//        print("Tap-nuli na menya")
//    }
//
//    @objc func handleLongPressTap() {
//        print("Dolgoe zajatie vyuwki")
//    }
    
    
    
    
    
    
    
    
    
    @IBAction func handleButtonTap(_ sender: Any) {
        
        
        print(slider.value)
        
        let selectedNumber = Int(slider.value)
        
        if selectedNumber == gameManager.guessingNumber {
            print("Vi ugadali chislo")
            //
            gameManager.score = gameManager.score + 100 // gameManager.score += 100
        } else if abs(gameManager.guessingNumber - selectedNumber) <= 10 {
            gameManager.score += 50
        } else {
            print("Probuyte ewe raz")
            gameManager.score -= 10
        }
        
        // proverka na konec igri
        if gameManager.round < 10 {
            gameManager.nextRound()
        } else {
            showGameOverAlert()
        }
        
        
        updateLabels()
        
    }
    
    func updateLabels() {
        guessingLabel.text = String(gameManager.guessingNumber)
        roundLabel.text = String(gameManager.round)
        scoreLabel.text = String(gameManager.score)
    }
    
    func showGameOverAlert() {
        print("Pokazat alert i nachat novuyu igru")
        let myAlert = UIAlertController(title: "Game Over", message: "Zarabotannie ochki: \(gameManager.score).  Nachat novuyu igru ?", preferredStyle: .alert)
        let handler: ((UIAlertAction) -> Void)? = { action in
            print("Startuen novuyu igru")
            self.gameManager.startNewGame()
            self.updateLabels()
        }
        let action = UIAlertAction(title: "Nachat", style: .default, handler: handler)
        myAlert.addAction(action)
        
        let cancelAction = UIAlertAction(title: "Zakonchit igru", style: .cancel)
        
        myAlert.addAction(cancelAction)
        
        show(myAlert, sender: self)

    }
    
    
}




