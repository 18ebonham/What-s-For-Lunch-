//
//  WebsiteLunchViewController.swift
//  What's For Lunch
//
//  Created by Hartley Bonham on 1/10/18.
//  Copyright © 2018 Hartley Bonham. All rights reserved.
//

import UIKit
import WebKit

class WebsiteLunchViewController: UIViewController {

    @IBOutlet weak var mondayText: UILabel!
    @IBOutlet weak var tuesdayText: UILabel!
    @IBOutlet weak var wednesdayText: UILabel!
    @IBOutlet weak var thursdayText: UILabel!
    @IBOutlet weak var fridayText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        let mondayLunchText = mondayLunch.joined(separator: "\n")
        
        print(mondayLunchText)
        mondayText.text = mondayLunchText
        
        //Tuesday
        var startTue = htmlContentTue.range(of: "Tues,").location
        htmlContentTue = htmlContentTue.substring(from: startTue) as NSString
        startTue = htmlContentTue.range(of: "Soup:").location
        htmlContentTue = htmlContentTue.substring(from: startTue) as NSString
        let endTue = htmlContentTue.range(of: "</p>").location
        let foodsForTuesday = htmlContentTue.substring(to: endTue)
        let tuesdayLunch = foodsForTuesday.components(separatedBy: "<br />")
        let tuesdayLunchText = tuesdayLunch.joined(separator: "\n")
        
        print(tuesdayLunchText)
        tuesdayText.text = tuesdayLunchText
        
        //Wednesday
        var startWed = htmlContentWed.range(of: "Wed,&nbsp").location
        htmlContentWed = htmlContentWed.substring(from: startWed) as NSString
        startWed = htmlContentWed.range(of: "Soup:").location
        htmlContentWed = htmlContentWed.substring(from: startWed) as NSString
        let endWed = htmlContentWed.range(of: "</p>").location
        let foodsForWednesday = htmlContentWed.substring(to: endWed)
        let wednesdayLunch = foodsForWednesday.components(separatedBy: "<br />")
        let wednesdayLunchText = wednesdayLunch.joined(separator: "\n")
        
        print(wednesdayLunchText)
        wednesdayText.text = wednesdayLunchText
        
        //Thursday
        var startThu = htmlContentThu.range(of: "Thurs,").location
        htmlContentThu = htmlContentThu.substring(from: startThu) as NSString
        startThu = htmlContentThu.range(of: "Soup:").location
        htmlContentThu = htmlContentThu.substring(from: startThu) as NSString
        let endThu = htmlContentThu.range(of: "</td>").location
        let foodsForThursday = htmlContentThu.substring(to: endThu)
        let thursdayLunch = foodsForThursday.components(separatedBy: "<br />")
        let thursdayLunchText = thursdayLunch.joined(separator: "\n")
        
        print(thursdayLunchText)
        thursdayText.text = thursdayLunchText
        
        //Friday
        var startFri = htmlContentFri.range(of: "Fri,&nbsp").location
        htmlContentFri = htmlContentFri.substring(from: startFri) as NSString
        startFri = htmlContentFri.range(of: "Soup:").location
        htmlContentFri = htmlContentFri.substring(from: startFri) as NSString
        let endFri = htmlContentFri.range(of: "</td>").location
        let foodsForFriday = htmlContentFri.substring(to: endFri)
        let fridayLunch = foodsForFriday.components(separatedBy: "<br />")
        let fridayLunchText = fridayLunch.joined(separator: "\n")
        
        print(fridayLunchText)
        fridayText.text = fridayLunchText
        
        
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
