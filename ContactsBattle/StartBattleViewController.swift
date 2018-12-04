//
//  SelectViewController.swift
//  ContactsBattle
//
//  Created by Thomas Kaczanko on 12/18/14.
//  Copyright (c) 2014 Zank. All rights reserved.
//

import UIKit
import AVFoundation

class StartBattleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var label1: UILabel!;
    @IBOutlet weak var label2: UILabel!;
    @IBOutlet weak var message: UILabel!;
   
    @IBOutlet weak var hp1: UILabel!;
    @IBOutlet weak var hp2: UILabel!;
    
    @IBOutlet weak var spellbook1: UIButton!;
    @IBOutlet weak var spellbook2: UIButton!;
    
    @IBOutlet weak var spellTableView: UITableView!;
    
    @IBOutlet weak var photo1: UIImageView!;
    @IBOutlet weak var photo2: UIImageView!;
    
    @IBOutlet weak var playAgainBtn: UIButton!;
    
    var audioPlayer = AVAudioPlayer();

    var spellnames:Array<String> = [];
    var spelllevels:Array<String> = [];
    
    var contactWithSpellbookOpen:Contact = Contact();
    
    var messageTimer:Timer = Timer();
    var shakeTimer1:Timer = Timer();
    var shakeTimer2:Timer = Timer();
    
    var whoTurnItIs:Contact = Contact();
    var whoWentFirst:Int = 0;
    
    override var prefersStatusBarHidden: Bool {
        return true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        let gradientLayer = CAGradientLayer();
        self.view.backgroundColor = UIColor.green;
        gradientLayer.frame = self.view.bounds;
        let color1 = UIColor(red: 0.247058, green: 0.396078, blue: 0.784313, alpha: 1.0).cgColor as CGColor;
        let color2 = UIColor(red: 0.384313, green: 0.662745, blue: 0.811764, alpha: 1.0).cgColor as CGColor;
        gradientLayer.colors = [color1, color2];
        gradientLayer.locations = [0.0, 1.0];
        self.view.layer.addSublayer(gradientLayer);
        
        navigationController?.navigationBar.isHidden = true;
    
        //ANALYTICS
        //
        print("There are " + String(stringInterpolationSegment: Int(sharedAnalytics.levelones)) +    " level 1 spells.");
        print("There are " + String(stringInterpolationSegment: Int(sharedAnalytics.leveltwos)) + " level 2 spells.");
        print("There are " + String(stringInterpolationSegment: Int(sharedAnalytics.levelthrees)) + " level 3 spells.");
        print("");
        
        print("The percentage of level 1 spells is " + String(stringInterpolationSegment: Int(sharedAnalytics.getPercentageOnes())));
        print("The percentage of level 2 spells is " + String(stringInterpolationSegment: Int(sharedAnalytics.getPercentageTwos())));
        print("The percentage of level 3 spells is " + String(stringInterpolationSegment: Int(sharedAnalytics.getPercentageThrees())));
        print("");
        
        var howmanyspells:Int = 0;
        for (spell, count) in sharedAnalytics.spellCountDictionary {
            print(String(Int(count)) + " -- " + sharedSpelbook.spells[spell]);
            howmanyspells += 1;
        }
        print("");
        print("There are " + String(howmanyspells) + " spells being used out of 20");
        print("");
        
        //
        //
        
        spellTableView.dataSource = self;
        spellTableView.delegate = self;
        
        //Label setup
        label1.font =  UIFont(name: "Futura", size: 22);
        label2.font =  UIFont(name: "Futura", size: 22);
        
        label1.textAlignment = NSTextAlignment.center;
        label2.textAlignment = NSTextAlignment.center;
        
        photo1.image = sharedSelectedContacts.contact1.photo;
        photo2.image = sharedSelectedContacts.contact2.photo;
        
        sharedSelectedContacts.getContact1().initializeForGame();
        sharedSelectedContacts.getContact2().initializeForGame();
        
        let h1:Int = sharedSelectedContacts.getContact1().hit_points;
        let h2:Int = sharedSelectedContacts.getContact2().hit_points;
    
        label1.text = sharedSelectedContacts.getContact1().name;
        label2.text = sharedSelectedContacts.getContact2().name;
        
        hp1.text = String(h1);
        hp2.text = String(h2);
        
        hp1.textColor = sharedStatColorDeterminer.getHPColorValue(stat: h1);
        hp2.textColor = sharedStatColorDeterminer.getHPColorValue(stat: h2);
        
        message.textAlignment = NSTextAlignment.center;
        message.font = UIFont(name: "Futura", size: 40);
        message.numberOfLines = 5;
        message.shadowColor = UIColor.black;
        
        //GUILE THEME START!
        if (sharedSettings.getBattleMusic()){
            let alertSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "guile", ofType: "mp3")!);
            
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback);
            } catch _ {
            };
            
            do {
                try AVAudioSession.sharedInstance().setActive(true);
            } catch _ {
            };
    
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: alertSound as URL);
            } catch _ {
            };
            
            audioPlayer.prepareToPlay();
            audioPlayer.play();
        }
        
        //Turn based battle-uuuuu!
        startTurnBasedBattle();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (sharedSettings.getBattleMusic()){
            audioPlayer.stop();
        }
    }
    
    func startTurnBasedBattle(){
        // Turn Based Battle
        whoGoesFirst();
    }
    
    func whoGoesFirst(){
        let goesFirst = Int(arc4random_uniform(100));
        var m = "";
        
        if (goesFirst >= 50){
            spellbook1.isHidden = false;
            spellbook2.isHidden = true;
            m = sharedSelectedContacts.getContact1().name + " goes first!";
            whoTurnItIs = sharedSelectedContacts.getContact1();
            whoWentFirst = 1;
        }else{
            spellbook2.isHidden = false;
            spellbook1.isHidden = true;
            m = sharedSelectedContacts.getContact2().name + " goes first!";
            whoTurnItIs = sharedSelectedContacts.getContact2();
            whoWentFirst = 2;
        }
        
        fadeInMessageDelay(t: m);
    }
    
    func fadeInMessageDelay(t:String){
        messageTimer.invalidate();
        message.alpha = 0;
        
        message.text = t;
        messageTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(fadeInMessage), userInfo: nil, repeats: false);
    }
    
    @objc func fadeInMessage(){
        messageTimer = Timer.scheduledTimer(timeInterval: 0.075, target: self, selector: #selector(fadeInMessageTick), userInfo: nil, repeats: true);
    }
    
    @objc func fadeInMessageTick(){
        if (message.alpha <= 1){
            message.alpha += 0.1;
        }else{
            messageTimer.invalidate();
            
            //Pause
            messageTimer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(fadeOutMessage), userInfo: nil, repeats: false);
        }

    }
    
    @objc func fadeOutMessage(){
        messageTimer = Timer.scheduledTimer(timeInterval: 0.075, target: self, selector: #selector(fadeOutMessageTick), userInfo: nil, repeats: true);
    }
    
    @objc func fadeOutMessageTick(){
        if (message.alpha >= 0){
            message.alpha -= 0.1;
        }else{
            messageTimer.invalidate();
        }
    }
    
    func turnTaken(slot:Int, spell:String, level:String){
        //Does it hit?
        let neededToHit:Int = sharedSpelbook.getSpellHitChance(slot: slot, level: Int(spelllevels[slot])!);
        
        let hit:Int = Int(arc4random_uniform(100));

        let doesItHit:Bool = hit <= neededToHit;
        
        print("0 to " + String(neededToHit) + " needed and rolled -- " + String(hit));
        
        //Show message and calc damage
        if (doesItHit){
            let damage:Int = sharedSpelbook.getSpellDamage(spellPower: contactWithSpellbookOpen.getSpellPower(), slot: slot, level: Int(spelllevels[slot])!);
            
            fadeInMessageDelay(t: whoTurnItIs.name + " casts " + spell + " level " + level + "... and it hits!");
            if (whoTurnItIs == sharedSelectedContacts.getContact1()){
                sharedSelectedContacts.getContact2().hit_points -= damage;
                shakeContact1();
            }else{
                sharedSelectedContacts.getContact1().hit_points -= damage;
                shakeContact2();
            }
        }else{
            fadeInMessageDelay(t: whoTurnItIs.name + " casts " + spell + " level " + level + "... and the spell misses.");
        }
        
        //Are they dead? (Best Comment Ever)
        if (sharedSelectedContacts.getContact1().hit_points <= 0){
            hp1.text = "0";
            message.text = whoTurnItIs.name + " wins!";
            spellbook2.isHidden = true;
            spellbook1.isHidden = true;
            playAgainBtn.isHidden = false;
            sharedSelectedContacts.contact1 = nil;
            sharedSelectedContacts.contact2 = nil;
            return;
        }else{
            hp1.text = String(sharedSelectedContacts.getContact1().hit_points);
        }
        
        if (sharedSelectedContacts.getContact2().hit_points <= 0){
            hp2.text = "0";
            message.text = whoTurnItIs.name + " wins!";
            spellbook2.isHidden = true;
            spellbook1.isHidden = true;
            playAgainBtn.isHidden = false;
            sharedSelectedContacts.contact1 = nil;
            sharedSelectedContacts.contact2 = nil;
            return;
        }else{
            hp2.text = String(sharedSelectedContacts.getContact2().hit_points);
        }
        
        //Next Turn
        if (whoTurnItIs == sharedSelectedContacts.getContact1()){
            spellbook2.isHidden = false;
            spellbook1.isHidden = true;
            whoTurnItIs = sharedSelectedContacts.getContact2();
        }else{
            spellbook1.isHidden = false;
            spellbook2.isHidden = true;
            whoTurnItIs = sharedSelectedContacts.getContact1();
        }
        
        //Increment turns?
    }
    
    func shakeContact1(){
        
    }
    
    func shakeContact2(){
        
    }
    
    @IBAction func spellbookOneTapped(_ sender: AnyObject) {
        contactWithSpellbookOpen = sharedSelectedContacts.getContact1();
        
        spellTableView.isHidden = !spellTableView.isHidden;
        setupSpellBook(c: sharedSelectedContacts.getContact1());
        spellTableView.reloadData();
    }
    
    @IBAction func spellbookTwoTapped(_ sender: AnyObject) {
        contactWithSpellbookOpen = sharedSelectedContacts.getContact2();
        
        spellTableView.isHidden = !spellTableView.isHidden;
        setupSpellBook(c: sharedSelectedContacts.getContact2());
        spellTableView.reloadData();
    }
    
    func setupSpellBook(c:Contact){
        spellnames = [c.spell1, c.spell2, c.spell3];
        spelllevels = [c.spell_level_1, c.spell_level_2, c.spell_level_3];
        spellTableView.reloadData();
    }
    
    func getSpellLevelText(level:String) -> String {
        if (level == "1"){
            return "I";
        }else if (level == "2"){
            return "II";
        }else{
            return "III";
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SpellCell = spellTableView.dequeueReusableCell(withIdentifier: "cell") as! SpellCell;
        
        cell.spellImage.image = UIImage(named: sharedSpelbook.getSpellImage(spell: spellnames[indexPath.row]) + "_" + spelllevels[indexPath.row] + ".png");
        
        cell.spellName.text = self.spellnames[indexPath.row] + " " + getSpellLevelText(level: spelllevels[indexPath.row]);
        
        cell.spellDescription.text = sharedSpelbook.getSpellDescription(spell: self.spellnames[indexPath.row]);
        
        cell.spellDamage.text = String(sharedSpelbook.getSpellDamage(spellPower: contactWithSpellbookOpen.getSpellPower(), slot: indexPath.row, level: Int(spelllevels[indexPath.row])!)) + " Damage";
        
        cell.spellHit.text = String(sharedSpelbook.getSpellHitChance(slot: indexPath.row, level: Int(spelllevels[indexPath.row])!)) + "% Hit";
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.spellnames.count;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        turnTaken(slot: indexPath.row, spell: spellnames[indexPath.row], level: spelllevels[indexPath.row]);
        spellTableView.isHidden = !spellTableView.isHidden;
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
            cell.backgroundColor = UIColor(red: 153/255, green: 204/255, blue: 255/255, alpha: 1);
    }

}

