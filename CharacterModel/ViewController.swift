//
//  ViewController.swift
//  CharacterModel
//
//  Created by Alisher Abdukarimov on 4/26/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    @IBOutlet weak var enemyHealthLabel: UILabel!
    @IBOutlet weak var enemyMagicLabel: UILabel!
    @IBOutlet weak var enemyWeaponLabel: UILabel!
    @IBOutlet weak var playerHealthLabel: UILabel!
    @IBOutlet weak var playerMagicLabel: UILabel!
    @IBOutlet weak var playerWeaponLabel: UILabel!
    @IBOutlet weak var playerExperienceLabel: UILabel!
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var enemyNameLabel: UILabel!
    @IBOutlet weak var playerMagicAvailabilityLabel: UILabel!
    
    var index = 0
    var moves = 0
    var turn: Bool = true
    var enemyWeapon = "Pistol"
    var alisher = Character(name: "Ali", life: 150, magic: 5, experience: 0.0, weapon: Pistol(), image: nil)
    var enemies: [Character] = [Character(name: "Clown", life: 150, magic: 0, experience: 0.0, weapon: MagicWand(), image: UIImage(named: "clown")!), Character(name: "Joker", life: 200, magic: 10, experience: 50, weapon: MagicWand(), image: UIImage(named: "joker")!)]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    

    
    @IBAction func useMagicTapped(_ sender: Any) {
        weaponOptionsTapped()
    }
    
    
    @IBAction func shootButtonTapped(_ sender: Any) {
        
        if moves == 2  {
            playerMagicLabel.text = "\(enemies[index].name) is attacking!"
            backFire(enemy: enemies[index])
            moves = 0
        }
        let gameStatus = checkTheMagicLevel(player: self.alisher)
        self.playerMagicAvailabilityLabel.text = gameStatus
        let enemyLife = checkLife(character: enemies[index])
        if enemyLife == true {
            if turn == true {
                alisher.shoot(taget: enemies[index])
                moves += 1
            }
        }else{
           index = 1
        }
        updateUI()
    }
    
    func updateUI() {
        OperationQueue.main.addOperation {
        self.enemyHealthLabel.text = "\(self.enemies[self.index].life)"
        self.enemyMagicLabel.text = "\(self.enemies[self.index].magic)"
        self.enemyWeaponLabel.text = self.enemyWeapon
        self.enemyNameLabel.text = "\(self.enemies[self.index].name)"
        self.imageViewOutlet.image = self.enemies[self.index].image
        self.playerNameLabel.text = "\(self.alisher.name)"
        self.playerMagicLabel.text = "\(self.alisher.magic)"
        self.playerHealthLabel.text = "\(self.alisher.life)"
        self.playerExperienceLabel.text = "\(self.alisher.experience)"
       }
    }
    
    func weaponOptionsTapped() {
        let optionShootMenu = UIAlertController(title: nil, message: "What would you like to do?", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Don't Use!", style: .cancel, handler: nil)
        optionShootMenu.addAction(cancelAction)
        
        let aidAction = UIAlertAction(title: "Add Health", style: .default) { (action: UIAlertAction!) -> Void in
            let mayOrMayNot = aid(player: self.alisher)
            if mayOrMayNot == true {
            self.playerMagicAvailabilityLabel.text = "Health is increased!"
            self.updateUI()
            }else{
            self.playerMagicAvailabilityLabel.text = "You don't Have enough Experience/Magic!"
            }
        }
        let rocketAction = UIAlertAction(title: "Use Rocket to damage -50", style: .default) { (action: UIAlertAction!) -> Void in
            let mayOrMayNot = rocket(player: self.alisher)
            if mayOrMayNot == true {
                self.playerMagicAvailabilityLabel.text = "Rocket is Ready!"
                self.updateUI()
            }else{
                self.playerMagicAvailabilityLabel.text = "You don't Have enough Experience/Magic!"
            }
        }
        let magicWandAction = UIAlertAction(title: "Use Magic Wand to damage -5", style: .default) { (action: UIAlertAction!) -> Void in
            let mayOrMayNot = magicWand(player: self.alisher)
            if mayOrMayNot == true {
                self.playerMagicAvailabilityLabel.text = "Use the MagicWand Boy!"
                self.updateUI()
            }else{
                self.playerMagicAvailabilityLabel.text = "You don't Have enough Experience/Magic!"
            }
        }
        let shotgunAction = UIAlertAction(title: "get shotgun to damage -10", style: .default) { (action: UIAlertAction!) -> Void in
            let mayOrMayNot = shotgun(player: self.alisher)
            if mayOrMayNot == true {
                self.playerMagicAvailabilityLabel.text = "Use the Shotgun Man!"
                self.updateUI()
            }else{
                self.playerMagicAvailabilityLabel.text = "You don't Have enough Experience/Magic!"
            }
        }
        optionShootMenu.addAction(rocketAction)
        optionShootMenu.addAction(shotgunAction)
        optionShootMenu.addAction(magicWandAction)
        optionShootMenu.addAction(aidAction)
        present(optionShootMenu, animated: true, completion: nil)
        
    }
    
    func backFire(enemy: Character) {
        
        
        enemy.shoot(taget: alisher)
        
        switch enemy.magic {
        case  0..<20:
            enemy.weapon = Pistol()
            enemyWeapon = "Pistol🔫"
        case  20..<40:
            enemy.weapon = MagicWand()
            enemyWeapon = "MagicWund"
        case  40..<60:
            enemy.weapon = Shotgun()
           enemyWeapon = "Shotgun😱"
        case  60..<100:
            enemy.weapon = Rocket()
            enemyWeapon = "Pistol🚀"
        default:
            enemy.weapon = Pistol()
        }
        
        turn = true
    }
}

