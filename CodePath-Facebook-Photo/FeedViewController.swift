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
            copyImageView.contentMode = UIViewContentMode.ScaleAspectFill
            copyImageView.clipsToBounds = true
            
            window.addSubview(copyImageView)
            containerView.addSubview(toViewController.view)
            
            toViewController.view.alpha = 0
            
            window.addSubview(copyImageView)
            containerView.addSubview(toViewController.view)
            
            UIView.animateWithDuration(0.4, animations: {
                copyImageView.frame.size.width = 320
                copyImageView.frame.size.height = (copyImageView.image!.size.height / copyImageView.image!.size.width) * 320
                copyImageView.center = window.center
                
                toViewController.view.alpha = 1
                
                }) { (finished:Bool) -> Void in
                    transitionContext.completeTransition(true)
                    copyImageView.removeFromSuperview()

            }
        } else {
            
            var window = UIApplication.sharedApplication().keyWindow
            var copyImageView = UIImageView(image: weddingImage.image)
            copyImageView.contentMode = UIViewContentMode.ScaleAspectFill
            copyImageView.clipsToBounds = true
            
            var scale = copyImageView.frame.width / 320
            
            copyImageView.center = window.center
            copyImageView.transform = CGAffineTransformMakeScale(scale, scale)
            
            window.addSubview(copyImageView)
            
            fromViewController.view.alpha = 0
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                copyImageView.frame.size = CGSize(width: self.weddingImage.frame.width, height: self.weddingImage.frame.height)
                copyImageView.frame = window.convertRect(self.weddingImage.frame, fromView: self.feedScrollView)
                
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
                    copyImageView.removeFromSuperview()
            }

            
        }
    }


}
