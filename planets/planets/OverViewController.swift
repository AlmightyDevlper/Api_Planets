//
//  OverViewController.swift
//  planets
//
//  Created by mac on 07/10/2022.
//

import Foundation
import UIKit

class OverViewController: UIViewController {
    
    var jsonDataReceiver: [String:Any] = [:]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        //Do things
    }

}

extension OverViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Do code
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Do code
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! tCellTableViewCell
        cell.textLabel!.text = "Demo text"
        return cell
    }
}
