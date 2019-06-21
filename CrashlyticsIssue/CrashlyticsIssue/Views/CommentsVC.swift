//
//  CommentsVC.swift
//  CrashlyticsIssue
//
//  Created by Anshuman Singh on 6/20/19.
//  Copyright © 2019 Anshuman Singh. All rights reserved.
//

import UIKit
import ACProgressHUD_Swift

class CommentsVC: UIViewController {
    
    @IBOutlet weak var tblView : UITableView!
    
    
    //view model instance, array of View Models.
    var model : DataList? {
        didSet {
            self.tblView.reloadData()
        }
    }
    
    //the url string, to fetch the comments associated with the issue.
    var comment_url : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Comments"
        tblView.backgroundColor = .clear
        tblView.register(UINib.init(nibName: "ListingCell", bundle: nil), forCellReuseIdentifier: "listCell")
        
        setUpData()
    }
    
    //Setting the data, to present it on the controller.
    private func setUpData() {
        
        //data handler object to retrieve the data.
        let handler = DataHandler()
        if let url = comment_url {
            ACProgressHUD.shared.showHUD()
            handler.getComments(url: url) { (list) in
                ACProgressHUD.shared.hideHUD()
                guard let _list = list , _list?.count ?? 0 > 0 else {
                    //fetching the default comments data, if issue doesn't contain any comments.
                    self.fetchDefaultData()
                    return
                }
                
                self.didValueUpdated(list : _list)
            }
        }
    }
    
    ///This methosd is for fetching the default comments data, if issue doesn't contain any comments, since few of the issues contains blank comments.
    private func fetchDefaultData() {
        let handler = DataHandler()
        ACProgressHUD.shared.showHUD()
        handler.getDummyCommentsData { (list) in
            if let list = list {
                self.didValueUpdated(list : list)
            }
        }
    }
    
    //method to assign delegates , datasource and update view model values.
    private func didValueUpdated(list : DataList) {
        //asssigning the delegates and datasource
        self.tblView.delegate = self
        self.tblView.dataSource = self
        
        //updating the view model values.
        self.model = list
    }
}

//MARK:- TableView Delegates and DataSource
extension CommentsVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model??.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as? ListingCell {
            cell.lblTitle?.text = model??[indexPath.section].title
            cell.lblDescription?.text = model??[indexPath.section].description
            cell.setNeedsUpdateConstraints()
            cell.updateConstraintsIfNeeded()
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView.init(frame: .init(x: 0, y: 0, width: tableView.bounds.width, height: 10))
        view.backgroundColor = .clear
        return view
    }
}
