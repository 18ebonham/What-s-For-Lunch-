//
//  ThisWeekViewController.swift
//  What's For Lunch
//
//  Created by Hartley Bonham on 1/7/18.
//  Copyright © 2018 Hartley Bonham. All rights reserved.
//

import UIKit


class ThisWeekViewController: UIViewController {
    
    
    //monday labels
    @IBOutlet weak var monMonthDayLabel: UILabel!
    @IBOutlet weak var monSoupLabel: UILabel!
    @IBOutlet weak var monGrillLabel: UILabel!
    @IBOutlet weak var monEntreeLabel: UILabel!
    @IBOutlet weak var monDessertLabel: UILabel!
    
    //tuesday labels
    @IBOutlet weak var tuesMonthDayLabel: UILabel!
    @IBOutlet weak var tuesSoupLabel: UILabel!
    @IBOutlet weak var tuesGrillLabel: UILabel!
    @IBOutlet weak var tuesEntreeLabel: UILabel!
    @IBOutlet weak var tuesDessertLabel: UILabel!
    
    //wednesday labels
    @IBOutlet weak var wedMonthDayLabel: UILabel!
    @IBOutlet weak var wedSoupLabel: UILabel!
    @IBOutlet weak var wedGrillLabel: UILabel!
    @IBOutlet weak var wedEntreeLabel: UILabel!
    @IBOutlet weak var wedDessertLabel: UILabel!
    
    //thursday labels
    @IBOutlet weak var thuMonthDayLabel: UILabel!
    @IBOutlet weak var thuSoupLabel: UILabel!
    @IBOutlet weak var thuGrillLabel: UILabel!
    @IBOutlet weak var thuEntreeLabel: UILabel!
    @IBOutlet weak var thuDessertLabel: UILabel!
    
    //friday labels
    @IBOutlet weak var friMonthDayLabel: UILabel!
    @IBOutlet weak var friSoupLabel: UILabel!
    @IBOutlet weak var friGrillLabel: UILabel!
    @IBOutlet weak var friEntreeLabel: UILabel!
    @IBOutlet weak var friDessertLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //initialize monday labels
        monMonthDayLabel.text = " "
        monSoupLabel.text = " "
        monGrillLabel.text = " "
        monEntreeLabel.text = " "
        monDessertLabel.text = " "
        
        //initialize tuesday labels
        tuesMonthDayLabel.text = " "
        tuesSoupLabel.text = " "
        tuesGrillLabel.text = " "
        tuesEntreeLabel.text = " "
        tuesDessertLabel.text = " "
        
        //initialize wednesday labels
        wedMonthDayLabel.text = " "
        wedSoupLabel.text = " "
        wedGrillLabel.text = " "
        wedEntreeLabel.text = " "
        wedDessertLabel.text = " "
        
        //initialize thursday labels
        thuMonthDayLabel.text = " "
        thuSoupLabel.text = " "
        thuGrillLabel.text = " "
        thuEntreeLabel.text = " "
        thuDessertLabel.text = " "
        
        //initialize friday labels
        friMonthDayLabel.text = " "
        friSoupLabel.text = " "
        friGrillLabel.text = " "
        friEntreeLabel.text = " "
        friDessertLabel.text = " "
        
        //grabbing HTML content of casti lunch menu
        let url = URL(string: "http://www.castilleja.org/page.cfm?p=940953")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error!)
            }
            else {
                let htmlContent = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print (htmlContent!)
            }
        }
        task.resume()
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
