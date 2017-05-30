//
//  LFSideViewController.swift
//  Lift
//
//  Created by Navya on 5/26/17.
//  Copyright © 2017 RadhikaX M V. All rights reserved.
//

import UIKit

class LFSideViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var imagesArray  = [UIImage]()
    var dataArray: NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customFooter()
        configureTableView()
        loadDataSource()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Custom Functions
    func customFooter()  {
        let  footerView = Bundle.main.loadNibNamed("LFSideFooterView", owner: nil, options: nil)![0] as! LFSideFooterView
        footerView.frame = CGRect(x: 0, y: self.view.frame.size.height - footerView.frame.height, width: self.view.frame.size.width, height: footerView.frame.height)
        self.view.addSubview(footerView as UIView)
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "LFSideViewTableViewCell", bundle: nil), forCellReuseIdentifier: "LFSideViewTableViewCell")
        tableView.register(UINib(nibName: "LFSideHeaderCell", bundle: nil), forCellReuseIdentifier: "LFSideHeaderCell")
    }
    
    func loadDataSource() {
        imagesArray = [UIImage(named: "Phone_Call")!,
                       UIImage(named: "Location_Pin")!,
                       UIImage(named: "Ride_Bicycle")!,
                       UIImage(named: "Lifters_Symbol")!,
                       UIImage(named: "Customer_Support")!,
                       UIImage(named: "About")!,
                       UIImage(named: "Rating")!]
        dataArray = ["+91 - 7868768686","Location","Rides","Lifters","Support","About us"," Rate us",]
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    // Default is 1 if not implemented
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 1:
            return imagesArray.count
        default:
            return 1
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LFSideHeaderCell", for: indexPath) as! LFSideHeaderCell
            cell.arrowButton.addTarget(self, action: #selector(moveToProfileSettingsScreen), for: .touchUpInside)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LFSideViewTableViewCell", for: indexPath) as! LFSideViewTableViewCell
            cell.sideCellImage.image = imagesArray[indexPath.row]
            cell.sideCellLabel.text = dataArray[indexPath.row] as? String
            
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
    // custom view for header. will be adjusted to default or specified header height
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return 250
        case 1:
            return 44.0
        default:
            return 0
        }
    }
    @IBAction func moveToProfileSettingsScreen(_ sender: Any) {
        
    }

}
