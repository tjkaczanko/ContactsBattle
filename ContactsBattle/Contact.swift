//
//  Contact.swift
//  ContactsBattle
//
//  Created by Thomas Kaczanko on 4/2/15.
//  Copyright (c) 2015 Zank. All rights reserved.
//

import UIKit

class Contact: NSObject {
    
    var name:String! = nil;
    var phone_num:String! = nil;
    var photo:UIImage! = nil;
    
    //Spell force and damage
    var charisma:Int = 0;
    
    //Spell knowledge and practice
    var intelligence:Int = 0;
    
    //Life force and health
    var hit_points:Int = 0;
    
    var spell1:String = "";
    var spell2:String = "";
    var spell3:String = "";
    
    var spell_level_1:String = "";
    var spell_level_2:String = "";
    var spell_level_3:String = "";
    
    override init() {
        super.init();
    }
    
    func getSpellPower() -> Int {
        // "Zimmers is most powerful Sorceror" version of Algorithm
        //return (charisma * intelligence) / 50;
        
        // 3 to 5
        return ((charisma * intelligence) % 3) + 3;
    }
    
    func initializeForGame(){
        setupStats(stats_seed: phone_num);
        setupSpellbook();
        setupSpellLevels();
        
        //println(name);
        //println(" cha: " + String(charisma));
        //println(" int: " + String(intelligence));
        //println(" hps: " + String(hit_points));
        //println(" " + spell1 + " " + spell_level_1);
        //println(" " + spell2 + " " + spell_level_2);
        //println(" " + spell3 + " " + spell_level_3);
        //println("");
        
        //println(String(getSpellPower()) + " -- " + name);
    }
    
    func setupStats(stats_seed:String){
        let hp_seed_1:String = ((stats_seed as NSString).substring(from: 0) as NSString).substring(to: 1);
        let hp_seed_2:String = ((stats_seed as NSString).substring(from: 1) as NSString).substring(to: 1);
        let hp_seed_3:String = ((stats_seed as NSString).substring(from: 2) as NSString).substring(to: 1);
        let hp_seed_4:String = "5";
        
        let cha_seed_1:String = ((stats_seed as NSString).substring(from: 3) as NSString).substring(to: 1);
        let cha_seed_2:String = ((stats_seed as NSString).substring(from: 4) as NSString).substring(to: 1);
        let cha_seed_3:String = ((stats_seed as NSString).substring(from: 5) as NSString).substring(to: 1);
        let cha_seed_4:String = ((stats_seed as NSString).substring(from: 6) as NSString).substring(to: 1);
        
        let int_seed_1:String = ((stats_seed as NSString).substring(from: 7) as NSString).substring(to: 1);
        let int_seed_2:String = ((stats_seed as NSString).substring(from: 8) as NSString).substring(to: 1);
        let int_seed_3:String = ((stats_seed as NSString).substring(from: 9) as NSString).substring(to: 1);
        let int_seed_4:String = "6";
        
        //Phone Number Crash Helper
        //print(stats_seed);
        
        charisma = Int(cha_seed_1)! + (10 - Int(cha_seed_2)!) + Int(cha_seed_3)! + (10 - Int(cha_seed_4)!) - 4;
        
        intelligence = (10 - Int(int_seed_1)!) + Int(int_seed_2)! + Int(int_seed_3)! + Int(int_seed_4)!;
        
        hit_points = 100 + (10 - Int(hp_seed_1)!) + (10 - Int(hp_seed_2)!) + Int(hp_seed_3)! + Int(hp_seed_4)!;
    }
    
    func setupSpellbook(){
        var seed1:Int = ((intelligence + 200) * 2421) % 20;
        var seed2:Int = ((intelligence + 444) * 6678) % 20;
        var seed3:Int = ((intelligence + 789) * 4443) % 20;
        
        while((seed1 == seed2) || (seed1 == seed3)){
            seed1 += 1;
            
            if (seed1 > 19){
                seed1 = 0;
            }
        }
        
        while((seed2 == seed3) || (seed2 == seed1)){
            seed2 += 1;
            
            if (seed2 > 19){
                seed2 = 0;
            }
        }
        
        while((seed3 == seed1) || (seed3 == seed2)){
            seed3 += 1;
            
            if (seed3 > 19){
                seed3 = 0;
            }
        }
        
        if (sharedAnalytics.spellCountDictionary[seed1] == nil){
            sharedAnalytics.spellCountDictionary[seed1] = 0;
        }
        
        if (sharedAnalytics.spellCountDictionary[seed2] == nil){
            sharedAnalytics.spellCountDictionary[seed2] = 0;
        }
        
        if (sharedAnalytics.spellCountDictionary[seed3] == nil){
            sharedAnalytics.spellCountDictionary[seed3] = 0;
        }
        
        let s1:Float = sharedAnalytics.spellCountDictionary[seed1]!;
        let s2:Float = sharedAnalytics.spellCountDictionary[seed2]!;
        let s3:Float = sharedAnalytics.spellCountDictionary[seed3]!;
        
        sharedAnalytics.spellCountDictionary[seed1] = s1 + 1;
        sharedAnalytics.spellCountDictionary[seed2] = s2 + 1;
        sharedAnalytics.spellCountDictionary[seed3] = s3 + 1;
        
        spell1 = sharedSpelbook.spells[seed1];
        spell2 = sharedSpelbook.spells[seed2];
        spell3 = sharedSpelbook.spells[seed3];
    }
    
    func setupSpellLevels(){
        //spell level 1
        if (charisma <= 12){
            spell_level_1 = "1";
            sharedAnalytics.levelones += 1;
        }else if (charisma > 12 && charisma <= 18){
            spell_level_1 = "2";
            sharedAnalytics.leveltwos += 1;
        }else{
            spell_level_1 = "3";
            sharedAnalytics.levelthrees += 1;
        }
        
        //spell level 2
        if (charisma <= 14){
            spell_level_2 = "1";
            sharedAnalytics.levelones += 1;
        }else if (charisma > 14 && charisma <= 20){
            spell_level_2 = "2";
            sharedAnalytics.leveltwos += 1;
        }else{
            spell_level_2 = "3";
            sharedAnalytics.levelthrees += 1;
        }
        
        //spell level 3
        if (charisma <= 16){
            spell_level_3 = "1";
            sharedAnalytics.levelones += 1;
        }else if (charisma > 16 && charisma <= 22){
            spell_level_3 = "2";
            sharedAnalytics.leveltwos += 1;
        }else{
            spell_level_3 = "3";
            sharedAnalytics.levelthrees += 1;
        }
    }
}















