//
//  SpellCell.swift
//  ContactsBattle
//
//  Created by Thomas Kaczanko on 4/22/15.
//  Copyright (c) 2015 Zank. All rights reserved.
//

import Foundation;
import UIKit;

class SpellCell: UITableViewCell{
    
    @IBOutlet weak var spellImage: UIImageView!;
    @IBOutlet weak var spellName: UILabel!;
    @IBOutlet weak var spellDescription: UILabel!;
    @IBOutlet weak var spellDamage: UILabel!;
    @IBOutlet weak var spellHit: UILabel!;
    
    override func awakeFromNib() {
        super.awakeFromNib();
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated);
        // Configure the view for the selected state
    }
    
}
