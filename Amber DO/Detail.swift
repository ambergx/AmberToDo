//
//  Detail.swift
//  Amber DO
//
//  Created by Amber Gu on 2020/8/30.
//  Copyright © 2020 Amber Gu. All rights reserved.
//

import UIKit

class Detail: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var task: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = task
    }

}
