//
//  ViewController.swift
//  planets
//
//  Created by mac on 08/02/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchButtonView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchButtonView.layer.cornerRadius = 10
        self.searchButtonView.layer.borderColor = CGColor.init(red: 253, green: 253, blue: 253, alpha: 1)
        self.searchButtonView.layer.borderWidth = 1
        
        
        self.searchView.layer.cornerRadius = 20
        self.searchView.layer.borderColor = CGColor.init(red: 253, green: 253, blue: 253, alpha: 1)
        self.searchView.layer.borderWidth = 1
        
    }


}

