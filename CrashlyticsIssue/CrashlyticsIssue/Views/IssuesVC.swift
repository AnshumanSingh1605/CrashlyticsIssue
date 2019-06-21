//
//  IssuesVC.swift
//  CrashlyticsIssue
//
//  Created by Anshuman Singh on 6/20/19.
//  Copyright © 2019 Anshuman Singh. All rights reserved.
//

import UIKit
import ACProgressHUD_Swift

class IssuesVC: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    //view model instance, array of View Models.
    var model : DataList? {
        didSet {
            self.tblView.reloadData()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting the title for the controller
        self.navigationItem.title = "Issues List"
        
        tblView.backgroundColor = .clear
        
        //registering the TableView Cell xib.
        tblView.register(UINib.init(nibName: "ListingCell", bundle: nil), forCellReuseIdentifier: "listCell")

        setUpData()
    }
    
    //Setting the data, to present it on the controller.
    private func setUpData() {
        
        //data handler object to retrieve the data.
        let handler = DataHandler()
        ACProgressHUD.shared.showHUD()
        self.tblView.isHidden = true
        handler.fetchIssues { (list) in
            self.tblView.isHidden = false
            ACProgressHUD.shared.hideHUD()
            if let list = list {
                
                //setting the tableview delegate and datasource
                self.tblView.delegate = self
                self.tblView.dataSource = self
                
                //updating the view model values.
                self.model = list
            }
        }
    }
}

//MARK:- TableView Delegates and DataSource
extension IssuesVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model??.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as? ListingCell {
            cell.lblTitle.text = model??[indexPath.section].title
            cell.lblDescription.text = model??[indexPath.section].description
            cell.accessoryType = .detailDisclosureButton
            
            cell.setNeedsUpdateConstraints()
            cell.updateConstraintsIfNeeded()
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let commentsVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "commentsVC") as? CommentsVC {
            commentsVC.comment_url = model??[indexPath.section].comments_url
            self.navigationController?.pushViewController(commentsVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView.init(frame: .init(x: 0, y: 0, width: tableView.bounds.width, height: 5))
        view.backgroundColor = .clear
        return view
    }
}
