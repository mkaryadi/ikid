//
//  ViewController.swift
//  ikid
//
//  Created by Matthew Karyadi on 5/4/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var currentJoke : UIViewController! = nil
    
    private func buildJokeVC (_ joke: String, _ punchline: String) -> JokeViewController {
        let jokeVC = storyboard?.instantiateViewController(withIdentifier: "Joke") as! JokeViewController
        jokeVC.joke = joke
        jokeVC.punchline = punchline
        jokeVC.root = self
        return jokeVC
    }
    
    func switchVCs (from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParent: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParent()
        }
        
        if to != nil {
            self.addChild(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParent: self)
            currentJoke = to
        }
    }
    
    @IBAction func pickJoke(_ sender: UIBarButtonItem) {
        var setup = ""
        var punchline = ""
        switch sender.title {
        case "Good":
            setup = "Here's a good setup"
            punchline = "Here's a good punchline"
        case "Pun":
            setup = "Here's a pun setup"
            punchline = "Here's a pun punchline"
        case "Dad":
            setup = "Here's a dad setup"
            punchline = "Here's a dad punchline"
        default:
            setup = "Error"
            punchline = "Error"
        }
        let jokeVC = buildJokeVC(setup, punchline)
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
        
        if currentJoke != nil && currentJoke.view.superview != nil {
            jokeVC.view.frame = view.frame
            switchVCs(from: currentJoke, to: jokeVC)
        } else {
            jokeVC.view.frame = view.frame
            switchVCs(from: nil, to: jokeVC)
        }
        UIView.commitAnimations()
    }
    
}

