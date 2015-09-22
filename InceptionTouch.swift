//
//  InceptionTouch.swift
//  InceptionTouch
//
//  Created by Ricardo Zertuche on 9/12/15.
//  Copyright (c) 2015 Ricardo Zertuche. All rights reserved.
//

import UIKit

protocol InceptionTouchDelegate {
    func typeOfLink(type: Int, link: String)
}

class InceptionTouch: UITextView, UITextViewDelegate {
    
    var inceptionTouchDelegate: InceptionTouchDelegate?
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
         super.init(frame: frame, textContainer: textContainer)
        self.dataDetectorTypes = UIDataDetectorTypes.All
        self.delegate = self
        self.editable = false
    }

    func textView(textView: UITextView, shouldInteractWithURL URL: NSURL, inRange characterRange: NSRange) -> Bool{
        
        let detector = try? NSDataDetector(types:    NSTextCheckingType.Address.rawValue |
                                                NSTextCheckingType.Date.rawValue |
                                                NSTextCheckingType.Link.rawValue |
                                                NSTextCheckingType.PhoneNumber.rawValue)
        
        
        let dreams = detector!.matchesInString(text, options: [], range: characterRange)
        for dream in dreams {
            if let dream_date = dream.date {
                self.inceptionTouchDelegate?.typeOfLink(0, link: "\(dream_date)")
            } else if let dream_number = dream.phoneNumber {
                self.inceptionTouchDelegate?.typeOfLink(1, link: "\(dream_number)")
            } else if let dream_url = dream.URL {
                self.inceptionTouchDelegate?.typeOfLink(2, link: "\(dream_url)")
            } else if let dream_addres = dream.addressComponents {
                self.inceptionTouchDelegate?.typeOfLink(3, link: "\(dream_addres)")
            }
        }
        
        return false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
