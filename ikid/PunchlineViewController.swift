//
//  PunchlineViewController.swift
//  ikid
//
//  Created by Matthew Karyadi on 5/5/22.
//

import UIKit

class PunchlineViewController: UIViewController {
    var joke = ""
    var punchline = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        NSLog("Go back!")
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
