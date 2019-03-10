//
//  twoController.swift
//  MyOneProject
//
//  Created by Anastasia Gayvoronskaya on 10/03/2019.
//  Copyright © 2019 Anastasia Gayvoronskaya. All rights reserved.
//

import UIKit
import Alamofire

class TwoController: UIViewController {
    
    var colorBG: UIColor?
    
    override func viewDidLoad() {
        self.view.backgroundColor = colorBG
    }
    
    @IBAction func back (_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
