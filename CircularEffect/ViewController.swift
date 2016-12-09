//
//  ViewController.swift
//  CircularEffect
//
//  Created by Basil on 2016-12-09.
//  Copyright © 2016 Makeinfo. All rights reserved.
//

import UIKit

//Credit : youtube.com/watch?v=B9sH_VxPPo4
//This is a practice project for CircularTransition

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var menuButton: UIButton!
    
    let transition = CircularTransition()   //Initializing the Transition function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        menuButton.layer.cornerRadius = menuButton.frame.size.width / 2     //For making rounded button
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController
        secondVC.transitioningDelegate = self               //transition will happen
        secondVC.modalPresentationStyle = .custom           // how a modally presented view controller is displayed onscreen.
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = menuButton.center
        transition.circleColor = menuButton.backgroundColor!
        return transition
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.transitionMode = .present
        transition.startingPoint = menuButton.center
        transition.circleColor = menuButton.backgroundColor!
        return transition
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

