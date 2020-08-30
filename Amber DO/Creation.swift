//
//  Creation.swift
//  Amber DO
//
//  Created by Amber Gu on 2020/8/30.
//  Copyright © 2020 Amber Gu. All rights reserved.
//

import UIKit

class Creation: UIViewController, UITextFieldDelegate {

    @IBOutlet var field: UITextField!
    
    var save: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
        
        field.becomeFirstResponder()
    }
    
    @objc func saveTask() {
        
        let vc = navigationController?.viewControllers[0] as! ViewController
        vc.currentText = field.text
        
        save?()
        
        navigationController?.popViewController(animated: true)
    }

}
