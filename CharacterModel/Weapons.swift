//
//  Weapons.swift
//  CharacterModel
//
//  Created by Alisher Abdukarimov on 5/12/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import Foundation

class Shotgun: Shootable {
    func shoot(target: Targetable) {
        target.doDamage(damage: 10)
    }
}
class Pistol: Shootable {
    func shoot(target: Targetable) {
        target.doDamage(damage: 2)
    }
}

class MagicWand: Shootable {
    func shoot(target: Targetable) {
        target.doDamage(damage: 5)
    }
}

class Rocket: Shootable {
    func shoot(target: Targetable) {
        target.doDamage(damage: 15)
    }
}

class Aid: Shootable {
    func shoot(target: Targetable) {
        target.doDamage(damage: 0)
    }
}
