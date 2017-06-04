//
//  LFPofileViewController.swift
//  Lift
//
//  Created by Navya on 5/30/17.
//  Copyright © 2017 RadhikaX M V. All rights reserved.
//

import UIKit

class LFPofileViewController: LFBaseVC,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var ratingImage: UIImageView!
    
    var imagesArray  = [UIImage]()
    var dataArray: NSMutableArray = NSMutableArray()
    var sideCellDataImages  = [UIImage]()
    var sideCellDataArray: NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customisingScreen()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Custom Functions
    
    func customisingScreen() {
        loadDataSource()
        showTransparentNavigationBar()
        configureTableView()
        addBackLeftButton()
        customFooter()
        scoreLabel.layer.borderWidth = 1.0
        scoreLabel.layer.cornerRadius = 6
        scoreLabel.layer.borderColor = UIColor.white.cgColor
        scoreLabel.layer.masksToBounds = true
        
        profileImage.layer.cornerRadius = self.profileImage.frame.height / 2.0
        profileImage.layer.masksToBounds = true


    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "LFSideHeaderCell", bundle: nil), forCellReuseIdentifier: "LFSideHeaderCell")
        tableView.register(UINib(nibName: "LFProfileDetailCell", bundle: nil), forCellReuseIdentifier: "LFProfileDetailCell")
        tableView.register(UINib(nibName: "LFSideViewTableViewCell", bundle: nil), forCellReuseIdentifier: "LFSideViewTableViewCell")
    }
    
    func customFooter()  {
        let  footerView = Bundle.main.loadNibNamed("LFProfileViewFooter", owner: nil, options: nil)![0] as! LFProfileViewFooter
        footerView.frame = CGRect(x: 0, y: self.view.frame.size.height - footerView.frame.height, width: self.view.frame.size.width, height: footerView.frame.height)
        self.view.addSubview(footerView as UIView)
    }
    
    func loadDataSource() {
        
        sideCellDataImages = [UIImage(named: "Phone_Call")!,
                              UIImage(named: "Mail")!]
        imagesArray = [UIImage(named: "Home")!,
                       UIImage(named: "SuitCase")!]
        
        sideCellDataArray = ["+91 - 7868768686","venkatesh.mandapati@gmil.com"]
        dataArray = ["Nagavara Outer Ring Road, Hebbal Kempapura, Bangalore - 560045, Near JAI Hanuman Petrol Bunk, Opposite To Bell Corporate Office","Near Innovative Multiplex, Outer Ring Road, Marathahalli Village, Marathahalli, Bengaluru, Karnataka 560037"]
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    // Default is 1 if not implemented
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return sideCellDataImages.count
        case 1:
            return imagesArray.count
            
        default:
            return 1
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LFSideViewTableViewCell", for: indexPath) as! LFSideViewTableViewCell
            cell.lineLabel.alpha = 0
            cell.sideCellImage.image = sideCellDataImages[indexPath.row]
            cell.sideCellLabel.text = sideCellDataArray[indexPath.row] as? String
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LFProfileDetailCell", for: indexPath) as! LFProfileDetailCell
            cell.descimage.image = imagesArray[indexPath.row]
            cell.descLabel.text = dataArray[indexPath.row] as? String
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
    // custom view for header. will be adjusted to default or specified header height
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return 44
        case 1:
            return 100
            
        default:
            return 0
        }
    }
    override func didPressedBackButton(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    
}
