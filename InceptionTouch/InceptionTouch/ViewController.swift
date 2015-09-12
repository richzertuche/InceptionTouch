//
//  ViewController.swift
//  InceptionTouch
//
//  Created by Ricardo Zertuche on 9/12/15.
//  Copyright (c) 2015 Ricardo Zertuche. All rights reserved.
//

import UIKit

class ViewController: UIViewController, InceptionTouchDelegate {

    var it_be: InceptionTouch?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        it_be = InceptionTouch(frame: CGRectMake(0, 100, self.view.frame.size.width, 300))
        it_be!.inceptionTouchDelegate = self
        it_be!.textAlignment = .Center
        it_be!.text = "Who needs 3D Touch when we have InceptionTouch \n\nhttp://www.github.com/richzertuche \nPhone number: (408) 996-1010 \n1 November 2015! \n1 Infinite Loop Cupertino, CA 95014"
        self.view .addSubview(it_be!)
        
    }

    func typeOfLink(type: Int, link: String) {
        //Type 0 - Date
        //Type 1 - Phone Numer
        //Type 2 - URL
        //Type 3 - Optional[Addres]
        println("\(type) - \(link)")
        
        if type == 2{
            self.showPreview(it_be!, link: link)
        } else {
            let alert = UIAlertView(title: "A dream inside a dream", message: "Handle me! I am \(link)", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        
    }
    
    func showPreview(sender: UIView, link: String){
        let custom = CustomPop()
        custom.preferredContentSize = CGSizeMake(self.view.frame.size.width - 20, 300)
        custom.popoverPresentationController?.sourceView = sender
        let wb = UIWebView(frame: CGRectMake(0, 0, self.view.frame.size.width - 20, 300))
        wb.loadRequest(NSURLRequest(URL: NSURL(string: link)!))
        custom.view.addSubview(wb)
        custom.popoverPresentationController?.sourceRect = CGRectMake(0, 0, self.view.frame.size.width - 20, 50)
        self.presentViewController(custom, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class CustomPop: UIViewController, UIPopoverPresentationControllerDelegate {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = UIModalPresentationStyle.Popover;
        self.popoverPresentationController?.delegate = self;
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle{
        return .None
    }
}
