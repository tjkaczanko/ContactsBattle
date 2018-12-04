//
//  ContactCell.swift
//  ContactsBattle
//
//  Created by Tom Kaczanko on 4/30/15.
//  Copyright (c) 2015 Zank. All rights reserved.
//

import Foundation;
import UIKit;

class ContactCell: UITableViewCell{

    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var contactName: UILabel!;
    @IBOutlet weak var contactHP: UILabel!;
    @IBOutlet weak var contactSpell1: UIImageView!;
    @IBOutlet weak var contactSpell2: UIImageView!;
    @IBOutlet weak var contactSpell3: UIImageView!;
    
    override func awakeFromNib() {
        super.awakeFromNib();
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated);
        // Configure the view for the selected state
    }
    
}
