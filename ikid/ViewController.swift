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
            setup = "What's the best part about Switzerland?"
            punchline = "I don't know, but the flag is a big plus!"
        case "Pun":
            setup = "What's the difference between a hippo and a zippo?"
            punchline = "One's really heavy and the other is a little lighter."
        case "Dad":
            setup = "My friend asked me what's upstairs..."
            punchline = "...I told them the stairs don't talk!"
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

