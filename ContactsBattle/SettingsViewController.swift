//
//  ViewController.swift
//  ContactsBattle
//
//  Created by Thomas Kaczanko on 12/18/14.
//  Copyright (c) 2014 Zank. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var battleBtn: UIButton!;
    @IBOutlet weak var infoBtn: UIButton!;
    
    @IBOutlet weak var battleMusicSwitch: UISwitch!;
    @IBOutlet weak var randomBattleSwitch: UISwitch!;
    
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
        
        navigationController?.navigationBar.isHidden = true
        
        battleMusicSwitch.setOn(sharedSettings.getBattleMusic(), animated: false);
        randomBattleSwitch.setOn(sharedSettings.getRandomBattle(), animated: false);

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func battleMusicChanged(_ sender: AnyObject) {
        sharedSettings.setBattleMusic(battleMusic: battleMusicSwitch.isOn);
    }

    @IBAction func randomResultChanged(_ sender: AnyObject) {
        sharedSettings.setRandomBattle(randomBattle: randomBattleSwitch.isOn);
    }
    
    @IBAction func infoTapped(_ sender: AnyObject){
        let alertController = UIAlertController(title: "Application Info", message:
            "Contacts Battle is a game that puts the friends and family on your contacts list into a fantasy battle against each other. Do you know the strongest spellcaster? \n\n Guile, Guile Theme registered trademark Capcom Co., Ltd. \n\n This app was developed by Zank. (https://www.linkedin.com/in/tkaczanko) \n\n", preferredStyle: UIAlertControllerStyle.alert);
        
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil));
        
        self.present(alertController, animated: true, completion: nil);
    }
    
}

