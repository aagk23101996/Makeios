//
//  ViewController.swift
//  MobilePricePredicition
//
//  Created by Apple on 08/04/19.
//  Copyright © 2019 Abhishek. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var SampleLabel: UILabel!
    @IBOutlet weak var tableDisplay: UITableView!
    var Columns = [String]()
    var dict : [String : Bool] = [:]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       //let mobile_model=MobilePrice()
        
       /* guard let mobile_class=try?mobile_model.prediction(battery_power: 1951, blue: 1, clock_speed: 2.6, dual_sim: 1, fc: 4, four_g: 1, int_memory: 47, m_dep: 0.3, mobile_wt: 199, n_cores: 4, pc: 7, px_height: 407, px_width: 822, ram: 1433, sc_h: 11, sc_w: 5, talk_time: 20, three_g: 1, touch_screen: 1, wifi: 1) else{
               fatalError("fatal error")
        };
 */
        Columns=["ybattery_power","blue","clock_speed","dual_sim","fc","four_g","int_memory","m_dep","mobile_wt","n_cores",
                 "pc","px_height","px_width","ram","sc_h","sc_w","talk_time","three_g","touch_screen","wifi"]
        

        
        
        //let m_class=mobile_class.price_range
       // label.text=String(m_class)
        tableDisplay.dataSource=self
        tableDisplay.delegate=self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
  @IBAction func final_button_pressed(_ sender: UIButton) {
    
     performSegue(withIdentifier: "sendData", sender: self)
    
   }
   
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Columns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells = tableDisplay.dequeueReusableCell(withIdentifier: "myRow", for: indexPath) as! TableViewCell
        
        cells.label?.text = Columns[indexPath.row]
        
        
        
        return cells
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dict[Columns[indexPath.row]]=true
        SampleLabel.text=String(dict.count)
    
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
         let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.backgroundColor = .white
        
        dict.removeValue(forKey: Columns[indexPath.row])
        SampleLabel.text=String(dict.count)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="sendData"{
            let secondVC = segue.destination as! SecondViewController
            secondVC.val = "Gr8"
            secondVC.dataReceived=dict
        }
    }
    
    

}

