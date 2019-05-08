//
//  SecondViewController.swift
//  MobilePricePredicition
//
//  Created by Apple on 09/04/19.
//  Copyright © 2019 Abhishek. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var secondImageView: UIImageView!
    
    @IBOutlet weak var sample_button_VC: UIButton!
    
    
    var final_output:String = ""
    
    @IBOutlet weak var secondVCtableView: UITableView!
    var val=""
    var arr_st : [String] = []
    
    var dataReceived : [String:Bool] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    secondImageView.loadGif(name:"image4")
     
       for key in dataReceived.keys{
        arr_st.append(key)
        }
        
        //secondVCLabel.text=String(dataReceived.count)
        secondVCtableView.delegate=self
        secondVCtableView.dataSource=self
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataReceived.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells = secondVCtableView.dequeueReusableCell(withIdentifier: "newRow", for: indexPath) as! SecondTableViewCell
        cells.secondLabel.text = arr_st[indexPath.row]
        //cells.set_val(getKey: arr_st[indexPath.row])
        cells.textField.text=""
        cells.getKey(key: arr_st[indexPath.row])
        
        return cells
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="thirdSegue"{
            let thirdVC = segue.destination as! ThirdViewController
            thirdVC.output=final_output
        }
    }
    
    
    
//    @IBAction func testButtonClick(_ sender:UIButton) {
//        testLabel.text=String(DataDictionary1.dict.count)
//    }
    
    @IBAction func sample_button_clicked(_ sender: UIButton) {
        
        
        
        

        var  dictObj = Data_Dictionary.dict
        let mob_model=MobilePrice()
        
        guard let mob_class=try?mob_model.prediction(battery_power: dictObj["battery_power",default: 4000], blue: dictObj["blue",default: 1], clock_speed: dictObj["clock_speed",default: 4], dual_sim: dictObj["dual_sim",default: 1], fc: dictObj["fc",default: 1], four_g: dictObj["four_g",default: 20], int_memory: dictObj["int_memory",default: 128], m_dep: dictObj["m_dep",default: 1], mobile_wt: dictObj["mobile_wt",default: 200], n_cores: dictObj["n_cores",default: 8], pc: dictObj["pc",default: 1], px_height: dictObj["px_height",default: 2000], px_width: dictObj["px_width",default: 2000], ram: dictObj["ram",default: 16000], sc_h: dictObj["sc_h",default: 20], sc_w: dictObj["sc_w",default: 20], talk_time: dictObj["talk_time",default: 100], three_g: dictObj["three_g",default: 1], touch_screen: dictObj["touch_screen",default: 1], wifi: dictObj["wifi",default: 1])else{
            fatalError("fatal error")
            };
            
        let val_received : String=String(mob_class.price_range)
        
        
            final_output=val_received
      performSegue(withIdentifier: "thirdSegue", sender: self)
        
        // label.text=String(m_class)
        
        
    }
    
    
    
    
}
