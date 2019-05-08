//
//  ThirdViewController.swift
//  MobilePricePredicition
//
//  Created by Apple on 11/04/19.
//  Copyright © 2019 Abhishek. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var thirdOutputLabel: UILabel!
    
    var output:String=""
    override func viewDidLoad() {
        super.viewDidLoad()
        if output=="0"{
            
            output=output+"\n"+"The estimated price of the phone is 1000-5000"
            
        }
        else if output=="1"{
        output=output+"\n"+"The estimated price of the phone is 5000-10000"
        }
        else if output=="2"{
        output=output+"\n"+"The estimated price of the phone is 10000-15000"
        }
        else{
            output=output+"\n"+"The estimated price of the phone is 15000-20000"
        }
        
        thirdOutputLabel.text=output

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
