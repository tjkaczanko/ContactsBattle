//
//  SelectViewController.swift
//  ContactsBattle
//
//  Created by Thomas Kaczanko on 12/18/14.
//  Copyright (c) 2014 Zank. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {
    
    @IBOutlet weak var label1: UIButton!;
    @IBOutlet weak var label2: UIButton!;
    
    override var prefersStatusBarHidden: Bool {
        return true;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "contact_1"){
            sharedSelectedContacts.setSeg(s: 1);
        }else{
            sharedSelectedContacts.setSeg(s: 2);
        }
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
        // Do any additional setup after loading the view, typically from a nib.
    
        label1.titleLabel!.font =  UIFont(name: "Futura", size: 40);
        label2.titleLabel!.font =  UIFont(name: "Futura", size: 40);
        
        label1.titleLabel!.numberOfLines = 3;
        label2.titleLabel!.numberOfLines = 3;
        
        label1.setTitle(sharedSelectedContacts.getContact1().name, for: []);
        label2.setTitle(sharedSelectedContacts.getContact2().name, for: []);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

