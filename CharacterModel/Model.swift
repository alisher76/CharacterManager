//
//  Model.swift
//  CharacterModel
//
//  Created by Alisher Abdukarimov on 5/12/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import Foundation
import UIKit

var reference: ViewController!

func aid(player: Character) -> Bool? {
    
    if player.magic >= 25 {
        player.useMagic(magicAmount: Int(player.experience / 8.0))
        player.magic -= 25
        player.experience += 25
        return true
    }else{
        return false
    }
}

func shotgun(player: Character) -> Bool {
    
    if player.experience >= 150 && player.magic >= 40 {
        player.weapon = Shotgun()
        player.experience += 50
        player.magic -= 50
        return true
    }else{
        return false
    }
}

func rocket(player: Character) -> Bool {
    
    if player.experience >= 250 && player.magic >= 70 {
        player.weapon = Rocket()
        player.experience += 100
        player.magic -= 70
        return true
    }else{
        return false
    }
}

func magicWand(player: Character) -> Bool {
    
    if  player.magic >= 20 {
        player.weapon = MagicWand()
        player.experience += 30
        player.magic -= 20
        return true
    }else{
        return false
    }
}



func checkLife(character: Character) -> Bool {
    if character.life <= 0 {
        return false
    }else{
        return true
    }
}



func checkTheMagicLevel(player: Character) -> String {
    var back: String = "Battle is on"
    if player.magic >= 20 && player.magic < 25{
        back = "Magic Wand is Available"
        return back
    }else if player.magic >= 25 && player.magic < 40 {
        back = "Magic Wand or Aid is Available"
        return back
    }else if player.magic >= 40 && player.magic < 70 {
        back = "Shotgun, Magic Wand, Aid are Available"
        return back
    }else if player.magic >= 70{
        back = "Rocket is Available"
        return back
    }else{
    return back
    }
}



