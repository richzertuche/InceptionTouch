//
//  ViewController.swift
//  InceptionTouch
//
//  Created by Ricardo Zertuche on 9/12/15.
//  Copyright (c) 2015 Ricardo Zertuche. All rights reserved.
//

import UIKit

class ViewController: UIViewController, InceptionTouchDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let it_be = InceptionTocuh(frame: CGRectMake(0, 100, self.view.frame.size.width, 300))
        it_be.inceptionTouchDelegate = self
        it_be.textAlignment = .Center
        it_be.text = "Who needs 3D Touch when we have InceptionTouch \nhttp://www.github.com/richzertuche \nPhone number: (408) 996-1010 \n1 November 2015! \n1 Infinite Loop Cupertino, CA 95014"
        self.view .addSubview(it_be)
        
    }

    func typeOfLink(type: Int, link: String) {
        //Type 0 - Date
        //Type 1 - Phone Numer
        //Type 2 - URL
        //Type 3 - Optional[Addres]
        println("\(type) - \(link)")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

