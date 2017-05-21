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
    
    ///JSONSerilization is needed
    
}


extension Character {
    
    convenience init?(jsonObject: [String:Any]) {
        guard let name = jsonObject[Character.nameKey] as? String,
            let life = jsonObject[Character.lifeKey] as? Int,
            let magic = jsonObject[Character.magicKey] as? Int,
            let experience = jsonObject[Character.experienceKey] as? Double,
            let weapon = jsonObject[Character.weaponKey] as? Shootable,
            let image = jsonObject[Character.imageKey] as? UIImage
            else {
                return nil
        }
        
        self.init(name: name,
                  life: life,
                  magic: magic,
                  experience:experience,
                  weapon: weapon,
                  image:image)
        
    }
    
    var jsonObject: [String:Any] {
        
        let back: [String:Any] = [
            Character.nameKey:name,
            Character.lifeKey:life,
            Character.magicKey:magic,
            Character.experienceKey:experience,
            Character.weaponKey: weapon,
            Character.imageKey: image
        ]
        return back
    }
    
    internal static var nameKey: String = "name"
    internal static var lifeKey: String = "life"
    internal static var magicKey: String = "magic"
    internal static var experienceKey: String = "experience"
    internal static var weaponKey: String = "weapon"
    internal static var imageKey: String = "image"
}


