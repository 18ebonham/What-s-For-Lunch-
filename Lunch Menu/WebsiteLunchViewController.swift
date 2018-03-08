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

    @IBOutlet weak var websiteLunchView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://docs.google.com/document/d/1MUFWGAU7VrNpaaX7aoJotm1ae_kz_oPTiKVIaEPAhzc/edit")
        websiteLunchView.loadRequest(URLRequest(url: url!))
  
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
