//
//  ReestrViewController.swift
//  RussianSable
//
//  Created by Кирилл Корнаков on 19.02.2021.
//

import UIKit



class ReestrViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var reloadButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var skinNumberLabel: UILabel!
    var skins: [SkinReestr] = []
    let apiClientReestr: ApiClientReestr = ApiClientReestrImpl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        reloadSkinData()
    }
    
    func showLoading(){
        activityIndicatorView.startAnimating()
        errorLabel.isHidden = true
        reloadButton.isHidden = true
    }
    
    func showData() {
        activityIndicatorView.stopAnimating()
        errorLabel.isHidden = true
        reloadButton.isHidden = true
    }
    
    func showError() {
        activityIndicatorView.stopAnimating()
        errorLabel.isHidden = false
        reloadButton.isHidden = false
    }
    
    func reloadSkinData() {
        showLoading()
        apiClientReestr.getReestr(onResult: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let skins):
                    self.skins = skins
                    self.tableView.reloadData()
                    self.showData()
                case .failure:
                    self.skins = []
                    self.tableView.reloadData()
                    self.showError()
                }
            }
            
        })
    }
    
    @IBAction func onReloadButtonTap(_ sender: Any) {
        reloadSkinData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SkinCell", for: indexPath)
        
        let skin = skins[indexPath.row]
        
        cell.textLabel?.text = skin.skinCode
        cell.detailTextLabel?.text = "\(skin.skinType) :: \(skin.skinSort)  :: \(skin.skinSize)"
        
        //cell.skinNumber?.text = skin.skinCode
        //cell.skinDetail?.text = "\(skin.skinType) :: \(skin.skinSort)  :: \(skin.skinSize)"
        //cell.skinPrice?.text = skin.skinPrice + "$"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
