//
//  PostViewController.swift
//  BreakPoint
//
//  Created by lucas on 20/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import UIKit
import Firebase

class PostViewController: UIViewController {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var btnSend: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         btnSend.bindToKeyboard()
    
    }
    @IBAction func onClickSend(_ sender: Any) {
        if textView.text != nil && textView.text != "Dis quelque chose ici..." {
                self.btnSend.isEnabled = false
            DataService.instance.uploadPost(message: textView.text!, uid: (Auth.auth().currentUser?.uid)!, groupKey: nil, complete: { (isComplete) in
                if isComplete {
                    self.btnSend.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                }else {
                    self.btnSend.isEnabled = true
                    print("Error")
                }
            })
        }
    }
    @IBAction func onClickClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
extension PostViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}


