//
//  JokeViewController.swift
//  ikid
//
//  Created by Matthew Karyadi on 5/5/22.
//

import UIKit

class JokeViewController: UIViewController {
    var joke: String = ""
    var punchline: String = ""
    var root: ViewController! = nil
    
    @IBOutlet weak var setupLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel.text = joke
        // Do any additional setup after loading the view.
    }
    
    private func buildPunchlineVC () -> PunchlineViewController {
        let punchlineVC = storyboard?.instantiateViewController(withIdentifier: "Punchline") as! PunchlineViewController
        punchlineVC.joke = joke
        punchlineVC.punchline = punchline
        return punchlineVC
    }
    
    private func switchVCs (from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParent: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParent()
        }
        
        if to != nil {
            self.addChild(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParent: self)
        }
    }
    
    @IBAction func next(_ sender: Any) {
        let punchLineVC = buildPunchlineVC()
        let currentJoke = root.currentJoke
        punchLineVC.view.frame = view.frame
        root.switchVCs(from: currentJoke, to: punchLineVC)
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
