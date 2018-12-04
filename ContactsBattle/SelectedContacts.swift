//
//  SelectedContacts.swift
//  ContactsBattle
//
//  Created by Thomas Kaczanko on 4/2/15.
//  Copyright (c) 2015 Zank. All rights reserved.
//

import UIKit

class SelectedContacts {

    var contact1:Contact! = nil;
    var contact2:Contact! = nil;
    var seg:Int!;
    
    init() {
        
    }
    
    func getContact1() -> Contact{
        if (contact1 != nil){
            return contact1;
        }
        
        let contact:Contact = Contact();
        contact.name = "Select Contact 1";
        contact.phone_num = "1234567890";
        contact.photo =  #imageLiteral(resourceName: "generic_man.jpg");
        
        return contact;
    }
    
    func setContact1(contact:Contact){
        self.contact1 = contact;
    }
    
    func getContact2() -> Contact{
        if (contact2 != nil){
            return contact2;
        }
        
        let contact:Contact = Contact();
        contact.name = "Select Contact 2";
        contact.phone_num = "1234567890";
        contact.photo =  #imageLiteral(resourceName: "generic_man.jpg");
        
        return contact;
    }
    
    func setContact2(contact:Contact){
        self.contact2 = contact;
    }
    
    func getContact1Display() -> String{
        return "\(contact1.name)";
    }
    
    func getContact2Display() -> String{
        return "\(contact2.name)";
    }
    
    func getSeg() -> Int{
        return seg;
    }
    
    func setSeg(s:Int){
        seg = s;
    }
}

let sharedSelectedContacts = SelectedContacts();
