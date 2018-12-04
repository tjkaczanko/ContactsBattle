//
//  Spellbook.swift
//  ContactsBattle
//
//  Created by Tom Kaczanko on 4/23/15.
//  Copyright (c) 2015 Zank. All rights reserved.
//

import Foundation
import UIKit

class Spellbook {
    
    var spells:Array<String> = [
                                "Acid Cloud",               //1
                                "Arcane Greatsword",        //2
                                "Bear Slap",                //3
                                "Dark Glare",               //4
                                "Demonic Rune",             //5
                                "Fireball",                 //6
                                "Gem Knives",               //7
                                "Horror",                   //8
                                "Ice Bolt",                 //9
                                "Lifeforce Attack",         //10
                                "Light Arrows",             //11
                                "Lightning Storm",          //12
                                "Magic Laser",              //13
                                "Needles",                  //14
                                "Pearl",                    //15
                                "Rock Throw",               //16
                                "Spirit Slice",             //17
                                "Sun Blast",                //18
                                "Ultima",                   //19
                                "Vine Whip"                 //20
                                ];
    
    init() {
        
    }
    
    func getSpellImage(spell:String) -> String {
        switch spell{
            case "Acid Cloud":
                return "acid_cloud";
            case "Arcane Greatsword":
                return "arcane_greatsword";
            case "Bear Slap":
                return "bear_slap";
            case "Dark Glare":
                return "dark_glare";
            case "Demonic Rune":
                return "demonic_rune";
            case "Fireball":
                return "fireball";
            case "Gem Knives":
                return "gem_knives";
            case "Horror":
                return "horror";
            case "Ice Bolt":
                return "ice_bolt";
            case "Lifeforce Attack":
                return "lifeforce_attack";
            case "Light Arrows":
                return "light_arrows";
            case "Lightning Storm":
                return "lightning_storm";
            case "Magic Laser":
                return "magic_laser";
            case "Needles":
                return "needles";
            case "Pearl":
                return "pearl";
            case "Rock Throw":
                return "rock_throw";
            case "Spirit Slice":
                return "spirit_slice";
            case "Sun Blast":
                return "sun_blast";
            case "Ultima":
                return "ultima";
            case "Vine Whip":
                return "vine_whip";
            default:
                return "";
        }
    }
    
    func getSpellDescription(spell:String) -> String{
        switch spell{
            case "Acid Cloud":
                return "A cloud of acid forms around your opponent, choking them.";
            case "Arcane Greatsword":
                return "A magical greatsword is swung at your opponent from above.";
            case "Bear Slap":
                return "Your opponent is slapped with the force of a great bear.";
            case "Dark Glare":
                return "Dark forces glare at your opponent, driving them mad.";
            case "Demonic Rune":
                return "A demonic rune is summoned below your opponent, sapping their lifeforce.";
            case "Fireball":
                return "A fireball materializes and flies at your opponent, exploding and burning them.";
            case "Gem Knives":
                return "Very sharp and pointy gems fly at your opponent, piercing them.";
            case "Horror":
                return "Your opponent is burdened with horrific visions.";
            case "Ice Bolt":
                return "A bolt of ice flies at your opponent, slicing and freezing.";
            case "Lifeforce Attack":
                return "A strange light appears around your opponent, sapping their life force.";
            case "Light Arrows":
                return "Arrows made of pure light fly at your opponent, piercing and burning.";
            case "Lightning Storm":
                return "A violent electrical storm appears, lightning strikes your opponent.";
            case "Magic Laser":
                return "A magical laser beams out from your hand, through your opponent.";
            case "Needles":
                return "Many metal needles appear and fly through your opponent.";
            case "Pearl":
                return "Holy magic forms around your opponent and explodes.";
            case "Rock Throw":
                return "Massive boulders are hurled at your opponent.";
            case "Spirit Slice":
                return "Spirit blades from the beyond slice your opponent many times.";
            case "Sun Blast":
                return "You praise the sun, it flares up and burns your opponent.";
            case "Ultima":
                return "The most powerful magical force explodes your opponent.";
            case "Vine Whip":
                return "Thorny vines spring up from the ground whipping your opponent over and over.";
            default:
                return "Invalid Spell";
        }
    }
    
    func getAllSpells() -> Array<String>{
        return spells;
    }
    
    // Slot is 0 based
    // Level is 1 based
    //
    // Confusing, right?
    //
    func getSpellDamage(spellPower:Int, slot:Int, level:Int) -> Int{
        let damageBase:Double = Double(spellPower);
        
        //Level 1
        if ( (slot == 0) && (level == 1) ){
            return Int(ceil(5.0 * damageBase));
        }
        
        if ( (slot == 1) && (level == 1) ){
            return Int(ceil(4.0 * damageBase));
        }
        
        if ( (slot == 2) && (level == 1) ){
            return Int(ceil(3.0 * damageBase));
        }
        
        //Level 2
        if ( (slot == 0) && (level == 2) ){
            return Int(ceil(7.0 * damageBase));
        }
        
        if ( (slot == 1) && (level == 2) ){
            return Int(ceil(6.0 * damageBase));
        }
        
        if ( (slot == 2) && (level == 2) ){
            return Int(ceil(5.0 * damageBase));
        }
        
        //Level 3
        if ( (slot == 0) && (level == 3) ){
            return Int(ceil(9.0 * damageBase));
        }
        
        if ( (slot == 1) && (level == 3) ){
            return Int(ceil(8.0 * damageBase));
        }
        
        if ( (slot == 2) && (level == 3) ){
            return Int(ceil(7.0 * damageBase));
        }
        
        return 9999;
    }
    
    func getSpellHitChance(slot:Int, level:Int) -> Int{
        
        //Level 1
        if ( (slot == 0) && (level == 1) ){
            return 75; // % chance to hit
        }
        
        if ( (slot == 1) && (level == 1) ){
            return 85; // % chance to hit
        }
        
        if ( (slot == 2) && (level == 1) ){
            return 95; // % chance to hit
        }
        
        //Level 2
        if ( (slot == 0) && (level == 2) ){
            return 60; // % chance to hit
        }
        
        if ( (slot == 1) && (level == 2) ){
            return 65; // % chance to hit
        }
    
        if ( (slot == 2) && (level == 2) ){
            return 70; // % chance to hit
        }
        
        //Level 3
        if ( (slot == 0) && (level == 3) ){
            return 45; // % chance to hit
        }
        
        if ( (slot == 1) && (level == 3) ){
            return 55; // % chance to hit
        }
        
        if ( (slot == 2) && (level == 3) ){
            return 65; // % chance to hit
        }
        
        return 9999;
    }
    
    
}

let sharedSpelbook = Spellbook();
