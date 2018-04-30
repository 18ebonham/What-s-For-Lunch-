//
//  WebsiteLunchViewController.swift
//  What's For Lunch
//
//  Copyright © 2018 Hartley Bonham. All rights reserved.
//

import UIKit
import WebKit

class WebsiteLunchViewController: UIViewController {

    //labels
    @IBOutlet weak var mondayFoodLabel: UILabel!
    @IBOutlet weak var tuesdayFoodLabel: UILabel!
    @IBOutlet weak var wednesdayFoodlabel: UILabel!
    @IBOutlet weak var thursdayFoodLabel: UILabel!
    @IBOutlet weak var fridayFoodLabel: UILabel!
    
    
    //display lunch for the week
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        var mondayLunchText = mondayLunch.joined(separator: "\n")
        mondayLunchText = mondayLunchText.replacingOccurrences(of: "&amp;", with: "&")
        mondayLunchText = mondayLunchText.replacingOccurrences(of: "&nbsp;", with: " ")
        print(mondayLunchText)
        mondayFoodLabel.text = mondayLunchText
        
        //Tuesday
        var startTue = htmlContentTue.range(of: "Tues,").location
        htmlContentTue = htmlContentTue.substring(from: startTue) as NSString
        startTue = htmlContentTue.range(of: "Soup:").location
        htmlContentTue = htmlContentTue.substring(from: startTue) as NSString
        let endTue = htmlContentTue.range(of: "</p>").location
        let foodsForTuesday = htmlContentTue.substring(to: endTue)
        let tuesdayLunch = foodsForTuesday.components(separatedBy: "<br />")
        var tuesdayLunchText = tuesdayLunch.joined(separator: "\n")
        tuesdayLunchText = tuesdayLunchText.replacingOccurrences(of: "&amp;", with: "&")
        tuesdayLunchText = tuesdayLunchText.replacingOccurrences(of: "&nbsp;", with: " ")
        print(tuesdayLunchText)
        tuesdayFoodLabel.text = tuesdayLunchText
        
        //Wednesday
        var startWed = htmlContentWed.range(of: "Wed,&nbsp").location
        htmlContentWed = htmlContentWed.substring(from: startWed) as NSString
        startWed = htmlContentWed.range(of: "Soup:").location
        htmlContentWed = htmlContentWed.substring(from: startWed) as NSString
        let endWed = htmlContentWed.range(of: "</p>").location
        let foodsForWednesday = htmlContentWed.substring(to: endWed)
        let wednesdayLunch = foodsForWednesday.components(separatedBy: "<br />")
        var wednesdayLunchText = wednesdayLunch.joined(separator: "\n")
        wednesdayLunchText = wednesdayLunchText.replacingOccurrences(of: "&amp;", with: "&")
        wednesdayLunchText = wednesdayLunchText.replacingOccurrences(of: "&nbsp;", with: " ")
        print(wednesdayLunchText)
        wednesdayFoodlabel.text = wednesdayLunchText
        
        //Thursday
        var startThu = htmlContentThu.range(of: "Thurs,").location
        htmlContentThu = htmlContentThu.substring(from: startThu) as NSString
        startThu = htmlContentThu.range(of: "Soup:").location
        htmlContentThu = htmlContentThu.substring(from: startThu) as NSString
        let endThu = htmlContentThu.range(of: "</td>").location
        let foodsForThursday = htmlContentThu.substring(to: endThu)
        let thursdayLunch = foodsForThursday.components(separatedBy: "<br />")
        var thursdayLunchText = thursdayLunch.joined(separator: "\n")
        thursdayLunchText = thursdayLunchText.replacingOccurrences(of: "&amp;", with: "&")
        thursdayLunchText = thursdayLunchText.replacingOccurrences(of: "&nbsp;", with: " ")
        print(thursdayLunchText)
        thursdayFoodLabel.text = thursdayLunchText
        
        //Friday
        var startFri = htmlContentFri.range(of: "Fri,&nbsp").location
        htmlContentFri = htmlContentFri.substring(from: startFri) as NSString
        startFri = htmlContentFri.range(of: "Soup:").location
        htmlContentFri = htmlContentFri.substring(from: startFri) as NSString
        let endFri = htmlContentFri.range(of: "</td>").location
        let foodsForFriday = htmlContentFri.substring(to: endFri)
        let fridayLunch = foodsForFriday.components(separatedBy: "<br />")
        var fridayLunchText = fridayLunch.joined(separator: "\n")
        fridayLunchText = fridayLunchText.replacingOccurrences(of: "&amp;", with: "&")
        fridayLunchText = fridayLunchText.replacingOccurrences(of: "&nbsp;", with: " ")
        print(fridayLunchText)
        fridayFoodLabel.text = fridayLunchText
        
        
        print(urlString)
  
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
