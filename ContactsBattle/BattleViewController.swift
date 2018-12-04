//
//  BattleViewController.swift
//  ContactsBattle
//
//  Created by Thomas Kaczanko on 12/18/14.
//  Copyright (c) 2014 Zank. All rights reserved.
//

import UIKit
import AddressBook
import AddressBookUI
import Contacts

class BattleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    

    @IBOutlet weak var tableView: UITableView!;
    
    override var prefersStatusBarHidden: Bool {
        return true;
    }
    
    override func viewDidLoad(){
        super.viewDidLoad();
        
        let gradientLayer = CAGradientLayer();
        self.view.backgroundColor = UIColor.green;
        gradientLayer.frame = self.view.bounds;
        let color1 = UIColor(red: 0.247058, green: 0.396078, blue: 0.784313, alpha: 1.0).cgColor as CGColor;
        let color2 = UIColor(red: 0.384313, green: 0.662745, blue: 0.811764, alpha: 1.0).cgColor as CGColor;
        gradientLayer.colors = [color1, color2];
        gradientLayer.locations = [0.0, 1.0];
        self.view.layer.addSublayer(gradientLayer);
        
        tableView.dataSource = self;
        tableView.delegate = self;
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell");
        
        getContactNames();
        
    }
    
    var contacts:Array<Contact> = [];
    var contact:Contact = Contact();
    var contactsDictionary = Dictionary<String, String>();
    
    var people:[CNContact] = [];
    
    func contactIterator(contact:CNContact, something:UnsafeMutablePointer<ObjCBool>){
        people.append(contact);
    }
    
    func getContactNames() {
        
        let store = CNContactStore();
        
        do {
            let fetchRequest:CNContactFetchRequest = CNContactFetchRequest(keysToFetch: [CNContactGivenNameKey as CNKeyDescriptor, CNContactFamilyNameKey as CNKeyDescriptor, CNContactPhoneNumbersKey as CNKeyDescriptor, CNContactImageDataKey as CNKeyDescriptor, CNContactOrganizationNameKey as CNKeyDescriptor, CNContactMiddleNameKey as CNKeyDescriptor]);
            
            try store.enumerateContacts(with: fetchRequest, usingBlock:contactIterator);
            
            //Needs a name seed, can't get all.
            //let people = try store.unifiedContactsMatchingPredicate(CNContact.predicateForContactsMatchingName(" "), keysToFetch: [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactImageDataKey]);
        
            var p_name:String?;
            var phone: String =  "";
            var phonen:CNPhoneNumber = CNPhoneNumber();
            
            for person in people {
                
                if (person.givenName != "" && person.familyName != ""){
                    if (person.middleName != ""){
                        p_name = person.givenName + " " + person.middleName + " " + person.familyName;
                    }else{
                        p_name = person.givenName + " " + person.familyName;
                    }
                }else if (person.givenName != ""){
                    p_name = person.givenName
                }else{
                    p_name = person.organizationName;
                }
                
                if (p_name == nil || p_name == ""){
                    continue;
                }
                
                let phones = person.phoneNumbers;

                for phonedata in phones{
                    
                    phonen = phonedata.value;
                    
                    phone = phonen.stringValue;
                    
                    //These two are different space characters in Apple's magical world
                    //
                    //Space from keyboard
                    phone = phone.replacingOccurrences(of: " ", with: "");
                    //
                    //Space copied from output that was still there after space from keyboard was removed
                    phone = phone.replacingOccurrences(of: " ", with: "");
                    
                    phone = phone.replacingOccurrences(of: "-", with: "");
                    phone = phone.replacingOccurrences(of: "+", with: "");
                    phone = phone.replacingOccurrences(of: ")", with: "");
                    phone = phone.replacingOccurrences(of: "(", with: "");
                    
                    // LETTERS!!!!
                    phone = phone.replacingOccurrences(of: "a", with: "6");
                    phone = phone.replacingOccurrences(of: "b", with: "5");
                    phone = phone.replacingOccurrences(of: "c", with: "4");
                    phone = phone.replacingOccurrences(of: "d", with: "3");
                    phone = phone.replacingOccurrences(of: "e", with: "2");
                    phone = phone.replacingOccurrences(of: "f", with: "1");
                    phone = phone.replacingOccurrences(of: "g", with: "0");
                    phone = phone.replacingOccurrences(of: "h", with: "9");
                    phone = phone.replacingOccurrences(of: "i", with: "8");
                    phone = phone.replacingOccurrences(of: "j", with: "7");
                    phone = phone.replacingOccurrences(of: "k", with: "6");
                    phone = phone.replacingOccurrences(of: "l", with: "5");
                    phone = phone.replacingOccurrences(of: "m", with: "4");
                    phone = phone.replacingOccurrences(of: "n", with: "4");
                    phone = phone.replacingOccurrences(of: "o", with: "3");
                    phone = phone.replacingOccurrences(of: "p", with: "2");
                    phone = phone.replacingOccurrences(of: "q", with: "1");
                    phone = phone.replacingOccurrences(of: "r", with: "0");
                    phone = phone.replacingOccurrences(of: "s", with: "9");
                    phone = phone.replacingOccurrences(of: "t", with: "8");
                    phone = phone.replacingOccurrences(of: "u", with: "7");
                    phone = phone.replacingOccurrences(of: "v", with: "6");
                    phone = phone.replacingOccurrences(of: "w", with: "5");
                    phone = phone.replacingOccurrences(of: "x", with: "4");
                    phone = phone.replacingOccurrences(of: "y", with: "3");
                    phone = phone.replacingOccurrences(of: "z", with: "2");
                    
                    // BIG LETTERS!!!
                    phone = phone.replacingOccurrences(of: "A", with: "1");
                    phone = phone.replacingOccurrences(of: "B", with: "2");
                    phone = phone.replacingOccurrences(of: "C", with: "3");
                    phone = phone.replacingOccurrences(of: "D", with: "4");
                    phone = phone.replacingOccurrences(of: "E", with: "5");
                    phone = phone.replacingOccurrences(of: "F", with: "6");
                    phone = phone.replacingOccurrences(of: "G", with: "7");
                    phone = phone.replacingOccurrences(of: "H", with: "8");
                    phone = phone.replacingOccurrences(of: "I", with: "9");
                    phone = phone.replacingOccurrences(of: "J", with: "0");
                    phone = phone.replacingOccurrences(of: "K", with: "1");
                    phone = phone.replacingOccurrences(of: "L", with: "2");
                    phone = phone.replacingOccurrences(of: "M", with: "3");
                    phone = phone.replacingOccurrences(of: "N", with: "4");
                    phone = phone.replacingOccurrences(of: "O", with: "5");
                    phone = phone.replacingOccurrences(of: "P", with: "6");
                    phone = phone.replacingOccurrences(of: "Q", with: "7");
                    phone = phone.replacingOccurrences(of: "R", with: "8");
                    phone = phone.replacingOccurrences(of: "S", with: "9");
                    phone = phone.replacingOccurrences(of: "T", with: "0");
                    phone = phone.replacingOccurrences(of: "U", with: "1");
                    phone = phone.replacingOccurrences(of: "V", with: "2");
                    phone = phone.replacingOccurrences(of: "W", with: "3");
                    phone = phone.replacingOccurrences(of: "X", with: "4");
                    phone = phone.replacingOccurrences(of: "Y", with: "5");
                    phone = phone.replacingOccurrences(of: "Z", with: "6");
                    
                    if (phone.count > 10){
                        phone  = (phone as NSString).substring(from: 1);
                    }else if (phone.count < 10){
                        phone = "3185745643";
                    }
                }
                
                let contactImage = person.imageData;
                
                if (contactsDictionary[p_name!] == nil){
                    contactsDictionary[p_name!] = phone;
                    
                    contact = Contact();
                    contact.name = p_name;
                    contact.phone_num = phone;
                    
                    if (contactImage != nil){
                        contact.photo = UIImage(data:contactImage!, scale:1.0);
                    }else{
                        contact.photo = #imageLiteral(resourceName: "generic_man.jpg");
                    }
                    
                    contacts.append(contact);
                    contact.initializeForGame();
                }
                
                //print(p_name);
                //print(phone);
            }

        } catch {
            //Apple doesn't want this anymore...
            //var something = 0;
            //something++;
            
            //But this is ok...
            let 💩 = "Oh poo, there was an error.";
            print(💩);
            
            return;
        }
        
        contacts = contacts.sorted(by: {
            (c1: Contact, c2: Contact) -> Bool in
            return c1.name < c2.name;
        });
        
        print("There are " + String(contacts.count) + " total contacts.");
        print("");
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contacts.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ContactCell = tableView.dequeueReusableCell(withIdentifier: "contactcell") as! ContactCell;
        
        cell.contactName.text = contacts[indexPath.row].name;
        cell.contactImage.image = contacts[indexPath.row].photo;
        cell.contactHP.text = String(contacts[indexPath.row].hit_points);
        
        cell.contactSpell1.image = UIImage(named: sharedSpelbook.getSpellImage(spell: contacts[indexPath.row].spell1) + "_" + contacts[indexPath.row].spell_level_1 + ".png");
        
        cell.contactSpell2.image = UIImage(named: sharedSpelbook.getSpellImage(spell: contacts[indexPath.row].spell2) + "_" + contacts[indexPath.row].spell_level_2 + ".png");
        
        cell.contactSpell3.image = UIImage(named: sharedSpelbook.getSpellImage(spell: contacts[indexPath.row].spell3) + "_" + contacts[indexPath.row].spell_level_3 + ".png");
        
        cell.contactHP.textColor = sharedStatColorDeterminer.getHPColorValue(stat: contacts[indexPath.row].hit_points);
    
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let contact_name: String = contacts[indexPath.row].name;
        let phone_num:String = contacts[indexPath.row].phone_num;
        let photo:UIImage = contacts[indexPath.row].photo;
        
        let contact = Contact();
        contact.name = contact_name;
        contact.phone_num = phone_num;
        contact.photo = photo;
        
        if (sharedSelectedContacts.getSeg() == 1){
            sharedSelectedContacts.setContact1(contact: contact);
        }else{
            sharedSelectedContacts.setContact2(contact: contact);
        }
        
    }
    
    func tableView(_: UITableView, willDisplay: UITableViewCell, forRowAt: IndexPath){
        willDisplay.backgroundColor = UIColor(red: 153/255, green: 204/255, blue: 255/255, alpha: 1);
    }
}
