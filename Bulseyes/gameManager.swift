//
//  gameManager.swift
//  Bulseyes
//
//  Created by second-admin on 23/06/23.
//

import Foundation


class GameManager {
    
    // Ugadivaemoe chislo
    var guessingNumber: Int
    
    // tekuwiy schet
    var score: Int
    
    // tekuwiy raund
    var round: Int
    
    // maksimalnoe chislo roundov
    let maxRound = 10
    
    init() {
        self.guessingNumber = Int.random(in: 1...100) // TODO: sgenerirovat chislo ot 1 do 100
        self.score = 0
        self.round = 1
    }
    
    func nextRound() {
        print("New round")
        round = round + 1
        guessingNumber = Int.random(in: 1...100)
    }
    
    func startNewGame() {
        guessingNumber = Int.random(in: 1...100)
        round = 1
        score = 0
    }
    
    
}
