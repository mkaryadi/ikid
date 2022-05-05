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
    var jokeVC : JokeViewController! = nil
    @IBOutlet weak var punchlineLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        punchlineLabel.text = punchline
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        jokeVC.view.frame = view.frame
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        UIView.setAnimationTransition(.flipFromLeft, for: jokeVC.root.view, cache: true)
        jokeVC.root.switchVCs(from: jokeVC.root.currentJoke, to: jokeVC)
        UIView.commitAnimations()
        
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
