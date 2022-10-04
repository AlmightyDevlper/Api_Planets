//
//  configure.swift
//  planets
//
//  Created by mac on 11/02/2022.
//

import Foundation
import UIKit

class configure: ViewController, UIView {
    
    override var searchButtonView: UIView!
    
   
    func configurelayoutHome() {
        self.searchButtonView.layer.cornerRadius = 10
        self.searchButtonView.layer.borderColor = CGColor.init(red: 253, green: 253, blue: 253, alpha: 1)
        self.searchButtonView.layer.borderWidth = 1
        
        
        self.searchView.layer.cornerRadius = 20
        self.searchView.layer.borderColor = CGColor.init(red: 253, green: 253, blue: 253, alpha: 1)
        self.searchView.layer.borderWidth = 1
        
        self.toYearInput.text = String(calender.component(.year, from: date))
    }
}
