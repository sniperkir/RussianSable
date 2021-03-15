//
//  AuctionViewController.swift
//  RussianSable
//
//  Created by Кирилл Корнаков on 14.03.2021.
//

import UIKit

class AuctionViewController: UIViewController {

    
    @IBOutlet weak var auctionNumberLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AuctionCell", for: indexPath)
        
        cell.auctionNumberLabel?.text = "test"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

 

}
