//
//  TodayViewController.swift
//  What's For Lunch
//
//  Created by Hartley Bonham on 1/7/18.
//  Copyright © 2018 Hartley Bonham. All rights reserved.
//

import UIKit
import WebKit

class TodayViewController: UIViewController {
    
    var soupLike = false
    var grillLike = false
    var entreeLike = false
    var dessertLike = false

    @IBOutlet weak var todayLunchWebView: WKWebView!
    
    @IBOutlet weak var todayDateLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // today's date
        todayDateLabel.text = "............. 🍴\(DateFormatter.localizedString(from: NSDate() as Date, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none))🍴 ............."

        // Do any additional setup after loading the view.
        
        
        
        //display today's lunch
        //let url = URL(string: "https://docs.google.com/document/d/1r589OZCs3wh2_qZ74ijOHV76Ov4CSbCuSJDQ4Lp3em4/edit")
        
        //todayLunchWebView.load(URLRequest(url: url!))
        
    }
    
    // soup like button
    @IBAction func soupLikeButton(_ sender: UIButton) {
        //change button to filled in version
        
        if soupLike == false {
            sender.setImage(UIImage(named: "filled in heart"), for: UIControlState.normal)
        } else {
            sender.setImage(UIImage(named: "heart outline"), for: UIControlState.normal)
        }
        soupLike = !soupLike
    }

    
    //grill like button
    @IBAction func grillLikeButton(_ sender: UIButton) {
        //change button to filled in version
        if grillLike == false {
            sender.setImage(UIImage(named: "filled in heart"), for: UIControlState.normal)
        } else {
            sender.setImage(UIImage(named: "heart outline"), for: UIControlState.normal)
        }
        grillLike = !grillLike
        }
    
    
    //entree like button
    @IBAction func entreeLikeButton(_ sender: UIButton) {
        //change button to filled in version
        if entreeLike == false {
            sender.setImage(UIImage(named: "filled in heart"), for: UIControlState.normal)
        } else {
            sender.setImage(UIImage(named: "heart outline"), for: UIControlState.normal)
        }
        entreeLike = !entreeLike
    }
    
    
    //dessert like button
    @IBAction func dessertLikeButton(_ sender: UIButton) {
        //change button to filled in version
        if dessertLike == false {
            sender.setImage(UIImage(named: "filled in heart"), for: UIControlState.normal)
        } else {
            sender.setImage(UIImage(named: "heart outline"), for: UIControlState.normal)
        }
        dessertLike = !dessertLike
    }
    
    //submit button
    @IBAction func submitButton(_ sender: Any) {
        var urlSoFar = "https://docs.google.com/forms/d/e/1FAIpQLScbi6oEupJMEStLrzynW5n4yAKun_wDf63J3lDC6h1cXy2YAg/formResponse?ifq&"
        if soupLike {
            urlSoFar += "entry.1500086948=Soup&"
        }
        if grillLike {
            urlSoFar += "entry.1500086948=Grill&"
        }
        if entreeLike {
            urlSoFar += "entry.1500086948=Entree&"
        }
        if dessertLike {
            urlSoFar += "entry.1500086948=Dessert&"
        }
        urlSoFar += "submit=Submit"
        let url = URL(string: urlSoFar)
        let urlString = try! String(contentsOf: url!, encoding: .utf8)
        
                
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
