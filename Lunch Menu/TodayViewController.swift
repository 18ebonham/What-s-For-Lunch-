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
    
    var timer: Timer!
    var startOfTomorrow: Date!
    
    @IBOutlet weak var soupLabel: UILabel!
    @IBOutlet weak var grillLabel: UILabel!
    @IBOutlet weak var entreeLabel: UILabel!
    @IBOutlet weak var dessertLabel: UILabel!
    
    
    @IBOutlet weak var soupHeart: UIButton!
    @IBOutlet weak var grillHeart: UIButton!
    @IBOutlet weak var entreeHeart: UIButton!
    @IBOutlet weak var dessertHeart: UIButton!
    
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var cafeClosedLabel: UILabel!

    @IBOutlet weak var todayDateLabel: UILabel!
    var weekMenuDict = [String:[String]]()
    var dayOfWeek = [1:"SUN",2:"MON",3:"TUE",4:"WED",5:"THU",6:"FRI",7:"SAT"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let rd = startOfTomorrow {
            if (Date() > rd){
                reset()
            }
        }
        
        
        // print today's date on top of screen
        todayDateLabel.text = "............. 🍴\(DateFormatter.localizedString(from: NSDate() as Date, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none))🍴 ............."

        // Do any additional setup after loading the view.
        // TODO find day of week
        var dow = Calendar.current.component(.weekday, from: Date())
        print(">>>Day of week:<<<<")
        print(dayOfWeek[dow])
        //dow=7
        if (dow == 1 || dow == 7) {
            cafeClosedLabel.text = "Café is closed today. \n Showing menu for Monday:"
            dow = 2
        }
        
        parseMenuHtml()
        let todaysMenu = weekMenuDict[dayOfWeek[dow]!]
        soupLabel.text = todaysMenu![0]
        grillLabel.text = todaysMenu![1]
        entreeLabel.text = todaysMenu![2]
        dessertLabel.text = todaysMenu![3]
        
    }
    
    func parseMenuHtml() {
        let url = URL(string: "https://www.castilleja.org/page.cfm?p=940953")
        let urlString = try! String(contentsOf: url!, encoding: .utf8)
        
        var htmlContentMon = urlString as NSString
        var htmlContentTue = urlString as NSString
        var htmlContentWed = urlString as NSString
        var htmlContentThu = urlString as NSString
        var htmlContentFri = urlString as NSString
        
        //Monday
        var startMon = htmlContentMon.range(of: "Mon,").location
        htmlContentMon = htmlContentMon.substring(from: startMon) as NSString
        startMon = htmlContentMon.range(of: "Soup:").location
        htmlContentMon = htmlContentMon.substring(from: startMon) as NSString
        let endMon = htmlContentMon.range(of: "</p>").location
        let foodsForMonday = htmlContentMon.substring(to: endMon)
        let mondayLunch = foodsForMonday.components(separatedBy: "<br />")
        weekMenuDict["MON"] = mondayLunch

        
        //Tuesday
        var startTue = htmlContentTue.range(of: "Tues,").location
        htmlContentTue = htmlContentTue.substring(from: startTue) as NSString
        startTue = htmlContentTue.range(of: "Soup:").location
        htmlContentTue = htmlContentTue.substring(from: startTue) as NSString
        let endTue = htmlContentTue.range(of: "</p>").location
        let foodsForTuesday = htmlContentTue.substring(to: endTue)
        let tuesdayLunch = foodsForTuesday.components(separatedBy: "<br />")
        weekMenuDict["TUE"] = tuesdayLunch

        
        //Wednesday
        var startWed = htmlContentWed.range(of: "Wed,&nbsp").location
        htmlContentWed = htmlContentWed.substring(from: startWed) as NSString
        startWed = htmlContentWed.range(of: "Soup:").location
        htmlContentWed = htmlContentWed.substring(from: startWed) as NSString
        let endWed = htmlContentWed.range(of: "</p>").location
        let foodsForWednesday = htmlContentWed.substring(to: endWed)
        let wednesdayLunch = foodsForWednesday.components(separatedBy: "<br />")
        weekMenuDict["WED"] = wednesdayLunch
 
        
        //Thursday
        var startThu = htmlContentThu.range(of: "Thurs,").location
        htmlContentThu = htmlContentThu.substring(from: startThu) as NSString
        startThu = htmlContentThu.range(of: "Soup:").location
        htmlContentThu = htmlContentThu.substring(from: startThu) as NSString
        let endThu = htmlContentThu.range(of: "</td>").location
        let foodsForThursday = htmlContentThu.substring(to: endThu)
        let thursdayLunch = foodsForThursday.components(separatedBy: "<br />")
        weekMenuDict["THU"] = thursdayLunch

        
        //Friday
        var startFri = htmlContentFri.range(of: "Fri,&nbsp").location
        htmlContentFri = htmlContentFri.substring(from: startFri) as NSString
        startFri = htmlContentFri.range(of: "Soup:").location
        htmlContentFri = htmlContentFri.substring(from: startFri) as NSString
        let endFri = htmlContentFri.range(of: "</td>").location
        let foodsForFriday = htmlContentFri.substring(to: endFri)
        let fridayLunch = foodsForFriday.components(separatedBy: "<br />")
        weekMenuDict["FRI"] = fridayLunch

        
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
        print("Submitting repponse")
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
        
        //submit button is now unclickable and changes text --> renables button
        submitButton.setTitle("Thank you for the feedback!", for: .normal)
        submitButton.isEnabled = false
        
        //disables button until next morning 86400
        let now = Date()
        startOfTomorrow = Calendar.current.startOfDay(for: now) + 86400
        self.submitButton.isEnabled = false
        timer = Timer.scheduledTimer(timeInterval: startOfTomorrow.timeIntervalSinceNow, target: self, selector: #selector(enableSubmitButton), userInfo: nil, repeats: false)
    }
    
    @objc func enableSubmitButton() {
        reset()
        timer.invalidate()
    }
    
    
    func reset() {
        soupHeart.setImage(UIImage(named: "heart outline"), for: UIControlState.normal)
        grillHeart.setImage(UIImage(named: "heart outline"), for: UIControlState.normal)
        entreeHeart.setImage(UIImage(named: "heart outline"), for: UIControlState.normal)
        dessertHeart.setImage(UIImage(named: "heart outline"), for: UIControlState.normal)
    
        self.submitButton.isEnabled = true
        self.submitButton.setTitle("SUBMIT", for: .normal)
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
