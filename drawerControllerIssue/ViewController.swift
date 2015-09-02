//
//  ViewController.swift
//  drawerControllerIssue
//
//  Created by David Ilizarov on 9/2/15.
//  Copyright (c) 2015 David Ilizarov. All rights reserved.
//

import UIKit
import MMDrawerController

class ViewController: UIViewController {

    var drawerController: MMDrawerController!
    
    @IBAction func goToBPressed(sender: AnyObject) {
        drawerController?.closeDrawerAnimated(true, completion: { _ in
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let centerViewController = mainStoryboard.instantiateViewControllerWithIdentifier("BViewController") as! BViewController
            let leftViewController = self.drawerController.leftDrawerViewController as! CViewController
            
            let communityDC = MMDrawerController(centerViewController: centerViewController, leftDrawerViewController: leftViewController)
            
            communityDC?.setMaximumLeftDrawerWidth(330, animated: true, completion: nil)
            communityDC?.openDrawerGestureModeMask = .All
            communityDC?.closeDrawerGestureModeMask = .All
            communityDC?.centerHiddenInteractionMode = .None
            communityDC?.setDrawerVisualStateBlock(MMDrawerVisualState.parallaxVisualStateBlockWithParallaxFactor(3)!)
            
            centerViewController.drawerController = communityDC
            
            self.presentViewController(communityDC, animated: true, completion: nil)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

