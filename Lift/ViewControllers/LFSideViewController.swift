//
//  LFSideViewController.swift
//  Lift
//
//  Created by Navya on 5/26/17.
//  Copyright © 2017 RadhikaX M V. All rights reserved.
//

import UIKit

class LFSideViewController: LFBaseVC,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var profileImage: UIImageView!

    var imagesArray  = [UIImage]()
    var dataArray: NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customisingScreen()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Custom Functions

    func customisingScreen() {
        loadDataSource()
        configureTableView()
        addCustomFooter()
        tableView.delegate = self
        tableView.dataSource = self
        profileImage.layer.cornerRadius = self.profileImage.frame.height / 2.0
        profileImage.layer.masksToBounds = true

        
    }

    func addCustomFooter()  {
        let  footerView = Bundle.main.loadNibNamed("LFSideFooterView", owner: nil, options: nil)![0] as! LFSideFooterView
        footerView.frame = CGRect(x: 0, y: self.view.frame.size.height - footerView.frame.height, width: self.view.frame.size.width, height: footerView.frame.height)
        self.view.addSubview(footerView as UIView)
    }
    
    func configureTableView() {
        tableView.register(UINib(nibName: "LFSideViewTableViewCell", bundle: nil), forCellReuseIdentifier: "LFSideViewTableViewCell")
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LFSideViewTableViewCell", for: indexPath) as! LFSideViewTableViewCell
        cell.sideCellImage.image = imagesArray[indexPath.row]
        cell.sideCellLabel.text = dataArray[indexPath.row] as? String
        
        return cell
    }
    
    // custom view for header. will be adjusted to default or specified header height
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    @IBAction func moveToProfileSettingsScreen(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let VC1 = storyBoard.instantiateViewController(withIdentifier: "LFPofileViewController") as! LFPofileViewController
        let navController = UINavigationController(rootViewController: VC1)
        // Creating a navigation controller with VC1 at the root of the navigation stack.
        self.present(navController, animated:true, completion: nil)
        
        
    }
    
}
