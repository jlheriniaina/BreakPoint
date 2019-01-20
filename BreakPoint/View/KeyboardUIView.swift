//
//  KeyboardUIView.swift
//  BreakPoint
//
//  Created by lucas on 20/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import UIKit

extension  UIView {

    func bindToKeyboard()  {
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeybord(_ :)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    @objc func hideKeybord(_ notification: NSNotification){
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curv = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let targetFram = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endFram = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = endFram.origin.y - targetFram.origin.y
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curv), animations: {
            self.frame.origin.y += deltaY
            
        }, completion: nil)
        
    }
}
