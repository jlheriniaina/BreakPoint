//
//  LoginViewController.swift
//  BreakPoint
//
//  Created by lucas on 20/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTxtField: InsetRectTextField!
    @IBOutlet weak var passwordTxtField: InsetRectTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    @IBAction func onClickClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onClickSignIn(_ sender: Any) {
        if emailTxtField.text != nil && emailTxtField.text != ""  && passwordTxtField.text != nil && passwordTxtField.text != "" {
            UserService.instance.login(email: emailTxtField.text!, password: passwordTxtField.text!, complete: { (succes, error) in
                if succes {
                    self.dismiss(animated: true, completion: nil)
                }else {
                    print(error?.localizedDescription)
                }
                UserService.instance.registerUser(email: self.emailTxtField.text!, password: self.passwordTxtField.text!, completion: { (succes, error) in
                    if succes {
                        UserService.instance.login(email: self.emailTxtField.text!, password: self.passwordTxtField.text!, complete: { (succes, errorlogin) in
                            if succes {
                                self.dismiss(animated: true, completion: nil)
                            }else {
                                  print(String(describing: errorlogin?.localizedDescription))
                            }
                        })
                    }else {
                        print(String(describing: error?.localizedDescription))
                    }
                })
            })
        }else {
            self.popuError(message: "Email ou mot de passe incorrect.\nVeuillez-ressayer...")
        }
    }
    func popuError(message: String) {
        let  popupView = PopupViewController()
        popupView.modalPresentationStyle = .custom
        popupView.message = message
        self.present(popupView, animated: true, completion: nil)
        
    }
    
}
