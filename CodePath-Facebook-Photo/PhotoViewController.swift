//
//  PhotoViewController.swift
//  CodePath-Facebook-Photo
//
//  Created by Sara Menefee on 10/4/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func doneImageBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
