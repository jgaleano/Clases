//
//  ViewController.swift
//  AnimacionesEjemplo
//
//  Created by Julio Cesar Galeano on 10/10/19.
//  Copyright © 2019 Julio Cesar Galeano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var vista: UIView!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func animacionClick(_ sender: Any) {
        
        //Cambiar el color
        UIView.animate(withDuration: 5, delay: 0, animations: {
            self.vista.backgroundColor = UIColor.blue
        })
        
        //Cambiar el tamaño
        let originalTransform = self.vista.transform
        let scaledTransform = originalTransform.scaledBy(x: 0.2, y: 0.2)
        //let translatedTransform = originalTransform.translatedBy(x: 0.0, y: -50.0)
        //let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: 0.0, y: -250.0)
        UIView.animate(withDuration: 2, animations: {
            self.vista.transform = scaledTransform
        })
    }
}

