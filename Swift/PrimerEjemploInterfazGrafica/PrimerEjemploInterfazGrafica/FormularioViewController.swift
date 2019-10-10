//
//  FormularioViewController.swift
//  PrimerEjemploInterfazGrafica
//
//  Created by Julio Cesar Galeano on 9/28/19.
//  Copyright © 2019 Julio Cesar Galeano. All rights reserved.
//

import UIKit

class FormularioViewController: UIViewController {
    
    @IBOutlet weak var customTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(FormularioViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(FormularioViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue
        if self.view.frame.origin.y == 0{
            self.view.frame.origin.y -= keyboardFrame.height
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}

extension FormularioViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
