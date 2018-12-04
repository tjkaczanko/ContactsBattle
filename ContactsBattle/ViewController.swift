//
//  ViewController.swift
//  ContactsBattle
//
//  Created by Thomas Kaczanko on 12/18/14.
//  Copyright (c) 2014 Zank. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var battleBtn: UIButton!;
    @IBOutlet weak var infoBtn: UIButton!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func infoTapped(sender: AnyObject){
        let alertController = UIAlertController(title: "Info", message:
            "Contacts Battle is a game that puts the friends and family on your contacts list into a fantasy battle against each other. Do you know the strongest warrior? \n\n Guile and Guile Theme registered trademark Capcom Co., Ltd. \n\n This app was developed by Zank. \n\n", preferredStyle: UIAlertControllerStyle.alert);
        
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil));
        
        self.present(alertController, animated: true, completion: nil);
    }

}

