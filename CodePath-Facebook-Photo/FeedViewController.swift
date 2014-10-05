//
//  FeedViewController.swift
//  CodePath-Facebook-Photo
//
//  Created by Sara Menefee on 10/1/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var feedViewImg: UIImageView!
  
    var isPresenting: Bool = true
    var weddingImage: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        feedScrollView.contentSize = feedViewImg.image!.size
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    @IBAction func tapWedding(gestureRecognizer: UITapGestureRecognizer) {
        performSegueWithIdentifier("photoSegue", sender: self)
        weddingImage = gestureRecognizer.view as UIImageView!
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
         return 0.4
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationViewController = segue.destinationViewController as UIViewController
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = self
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {

        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            var window = UIApplication.sharedApplication().keyWindow
            var frame = window.convertRect(weddingImage.frame, fromView: feedScrollView)
            var copyImageView = UIImageView(frame: frame)
            copyImageView.image = weddingImage.image
            
            window.addSubview(copyImageView)
            containerView.addSubview(toViewController.view)
            
            toViewController.view.alpha = 0
            var scalex = copyImageView.frame.width
            var scaley = copyImageView.frame.height
            
            window.addSubview(copyImageView)
            containerView.addSubview(toViewController.view)
            
            UIView.animateWithDuration(0.4, animations: {
                toViewController.view.alpha = 1
                toViewController.view.transform = CGAffineTransformMakeScale(scalex, scaley)
                copyImageView.center.x = 160
                copyImageView.center.y = 284
                
                }) { (finished:Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
            }, completion: { (Bool) -> Void in
                transitionContext.completeTransition(true)
                fromViewController.view.removeFromSuperview()
            })
            
        }
    }


}
