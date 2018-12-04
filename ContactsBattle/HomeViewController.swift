//
//  BattleViewController.swift
//  ContactsBattle
//
//  Created by Thomas Kaczanko on 12/18/14.
//  Copyright (c) 2014 Zank. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController{
    @IBOutlet weak var titleBtn: UIButton!;
    @IBOutlet weak var battleBtn: UIButton!;
    @IBOutlet weak var settingsBtn: UIButton!;
    
    override var prefersStatusBarHidden: Bool {
        return true;
    }
    
    override func viewDidLoad(){
        super.viewDidLoad();
        
        navigationController?.navigationBar.isHidden = true;
        
        let gradientLayer = CAGradientLayer();
        self.view.backgroundColor = UIColor.green;
        gradientLayer.frame = self.view.bounds;
        let color1 = UIColor(red: 0.247058, green: 0.396078, blue: 0.784313, alpha: 1.0).cgColor as CGColor;
        let color2 = UIColor(red: 0.384313, green: 0.662745, blue: 0.811764, alpha: 1.0).cgColor as CGColor;
        gradientLayer.colors = [color1, color2];
        gradientLayer.locations = [0.0, 1.0];
        self.view.layer.addSublayer(gradientLayer);
        
        titleBtn.titleLabel?.shadowColor = UIColor.black;
        battleBtn.titleLabel?.shadowColor = UIColor.black;
        settingsBtn.titleLabel?.shadowColor = UIColor.black;
    }    
}
