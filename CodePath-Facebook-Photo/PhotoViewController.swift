//
//  PhotoViewController.swift
//  CodePath-Facebook-Photo
//
//  Created by Sara Menefee on 10/4/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var controlsImg: UIImageView!
    
    var image: UIImage!
    var offset: CGFloat!
    var scale: CGFloat!
    var origin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneBtn.alpha = 1
        controlsImg.alpha = 1
        
        scrollView.delegate = self
        scrollView.contentSize = CGSizeMake(320, 568)
        
        imageView.image = image
        imageView.hidden = true
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.center = view.center
        
        view.backgroundColor = UIColor (white: 0.0, alpha: 0.0)
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        offset = scrollView.contentOffset.y
        scrollView.backgroundColor = UIColor(white: 0, alpha: ((100-abs(offset))/100))
    }

    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        origin = imageView.frame.origin
        
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.doneBtn.alpha = 0
            self.controlsImg.alpha = 0
        })
    
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            if (abs(offset) > 100) {
                dismissViewControllerAnimated(true, completion: nil)
                UIView.animateWithDuration(0.1, animations: { () -> Void in
                    self.doneBtn.alpha = 1
                    self.controlsImg.alpha = 1
                })
            }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.doneBtn.alpha = 1
            self.controlsImg.alpha = 1
        })
    }


    override func viewDidAppear(animated: Bool) {
        imageView.hidden = false
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func doneImageBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
