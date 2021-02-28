//
//  ReportViewController.swift
//  RussianSable
//
//  Created by Кирилл Корнаков on 20.02.2021.
//

import UIKit

class ReportViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableViewReport: UITableView!
    
    @IBOutlet weak var activityReportIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var errorReportLabel: UILabel!
    
    @IBOutlet weak var reloadReportButton: UIButton!

    var rfiles: [ReportFiles] = []
    let apiClientFiles: ApiClientFiles = ApiClientFilesImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        reloadReportsData()
        
    }
    
    func showLoadingFiles(){
        activityReportIndicatorView.startAnimating()
        errorReportLabel.isHidden = true
        reloadReportButton.isHidden = true
    }

    func showDataFiles() {
        activityReportIndicatorView.stopAnimating()
        errorReportLabel.isHidden = true
        reloadReportButton.isHidden = true
    }

    func showErrorFiles() {
        activityReportIndicatorView.stopAnimating()
        errorReportLabel.isHidden = false
        reloadReportButton.isHidden = false
    }

    func reloadReportsData() {
        showLoadingFiles()
        apiClientFiles.getReports(onResult: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let rfiles):
                    self.rfiles = rfiles
                    self.tableViewReport.reloadData()
                    self.showDataFiles()
                case .failure:
                    self.rfiles = []
                    self.tableViewReport.reloadData()
                    self.showErrorFiles()
                }
            }

        })
    }

    @IBAction func reloadReportButton(_ sender: Any) {
        reloadReportsData()
    }

    func tableView(_ tableViewReport: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rfiles.count
    }

    func tableView(_ tableViewReport: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewReport.dequeueReusableCell(withIdentifier: "FileCell", for: indexPath)

        let rfile = rfiles[indexPath.row]

        cell.textLabel?.text = "\(rfile.ftype) № \(rfile.fname)"
        cell.detailTextLabel?.text = rfile.fdate

        return cell
    }


    func tableView(_ tableViewReport: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    

}

