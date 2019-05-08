//
//  SecondTableViewCell.swift
//  MobilePricePredicition
//
//  Created by Apple on 09/04/19.
//  Copyright © 2019 Abhishek. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    var attribute_name : String = ""
    
    @IBOutlet weak var textField: UITextField!
    var key=""
    @IBOutlet weak var secondLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
//        secondEditText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    func set_val(getKey:String){
//        key=getKey
//
//    }
//    @objc func textFieldDidChange(_ textField: UITextField) {
//        DataDictionary1.dict[key]=textField.text!
//    }
    func getKey(key : String){
        attribute_name=key
        
    }
   
    @IBAction func editing_ended(_ sender: UITextField) {
        Data_Dictionary.dict[attribute_name]=Double(sender.text!)
        
    }
}
