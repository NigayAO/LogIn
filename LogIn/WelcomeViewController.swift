//
//  WelcomeViewController.swift
//  LogIn
//
//  Created by Alik Nigay on 27.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    
    @IBOutlet weak var textLabel: UILabel!
    
    var textForLabel: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = textForLabel
    }
    
    @IBAction func logOutPressed(_ sender: UIButton) {
    }
    

}
