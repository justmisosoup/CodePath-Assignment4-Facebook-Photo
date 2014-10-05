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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        imageView.hidden = true
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.center = view.center
        
        scrollView.delegate = self
        scrollView.contentSize = CGSizeMake(320, 568)
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
