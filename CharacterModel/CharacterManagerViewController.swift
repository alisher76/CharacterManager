//
//  CharacterManagerViewController.swift
//  CharacterModel
//
//  Created by Alisher Abdukarimov on 5/19/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import UIKit

class CharacterManagerViewController: UIViewController {
    
    @IBOutlet var characterNameLabel: UILabel!
    @IBOutlet var healthLabel: UILabel!
    
    @IBOutlet var magicLabel: UILabel!
    @IBOutlet var maxLifeLimitLabel: UILabel!
    
    @IBOutlet var experienceLabel: UILabel!
    
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var backgroundImageView: UIImageView!
    
    
    var ali = Character(name: "Ali", life: 100, magic: 0, experience: 0.0, weapon: Pistol(), image: UIImage(named: "pizza")!)
    
    var limit: Int = 100
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
    }
    
    @IBAction func heal1ButtonTapped(_ sender: Any) {
        
        let isDead = checkDeadOrAlive()
        if isDead == false{
            ali.life += 1
            upgradeLife()
            if ali.life >= limit {
                ali.life = limit
            }
            updateUI()
        }
    }
    
    @IBAction func heal10ButtonTapped(_ sender: Any) {
        
        
        let isDead = checkDeadOrAlive()
        if isDead == false{
            ali.life += 10
            upgradeLife()
            if ali.life >= limit {
                ali.life = limit
            }
            updateUI()
        }
    }
    
    @IBAction func damage1ButtonTapped(_ sender: Any) {
        
        if ali.life <= 0 {
            statusLabel.text = "\(ali.name) is dead!"
            backgroundImageView.image = ali.image
        }else {
            ali.life -= 1
            updateUI()
        }
    }
    
    @IBAction func damage10ButtonTapped(_ sender: Any) {
        if ali.life <= 0 {
            statusLabel.text = "\(ali.name) is dead!"
            backgroundImageView.image = ali.image
        }else{
            ali.life -= 10
            updateUI()
        }
    }
    
    func updateUI() {
        characterNameLabel.text = ali.name
        healthLabel.text = "\(ali.life)"
        magicLabel.text =  "\(ali.magic)"
        experienceLabel.text = "\(ali.experience)"
        maxLifeLimitLabel.text = "Max:\(limit)"
    }
    
    
    
    func checkDeadOrAlive() -> Bool {
        if ali.life <= 0 {
            statusLabel.text = "\(ali.name) is dead!"
            backgroundImageView.image = ali.image
            return true
        }else{
            return false
        }
        
    }
    
    func upgradeLife() {
        if ali.experience >= 70 && ali.experience <= 99 {
            limit = 150
            updateUI()
        }else if ali.experience >= 100 {
            limit = 200
            updateUI()
        }
    }
    
    
}
