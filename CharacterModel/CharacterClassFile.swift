//
//  CharacterClassFile.swift
//  CharacterModel
//
//  Created by Alisher Abdukarimov on 4/26/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import Foundation
import UIKit

protocol Targetable {
    var life: Int { get set }
    func doDamage(damage: Int)
    func useMagic(magicAmount: Int)
    
}

protocol Shootable {
    func shoot(target: Targetable)
}

class Character: Targetable {
    
    
    var weapon: Shootable!

    func useMagic(magicAmount: Int) {
        life += magicAmount
        experience += 5
        magic += 2
      
    }
    func doDamage(damage: Int) {
        life -= damage
        experience += 5
    }
    
    func shoot(taget: Targetable) {
        weapon.shoot(target: taget)
        experience += 5
        magic += 2
    }
    
    var name: String
    var life: Int
    var magic: Int
    var experience: Double
    var image: UIImage?
    
    init(name: String, life: Int, magic: Int, experience: Double, weapon: Shootable, image: UIImage?) {
        self.name = name
        self.life = life
        self.magic = magic
        self.experience = experience
        self.weapon = weapon
        self.image = image
    }
    
}





