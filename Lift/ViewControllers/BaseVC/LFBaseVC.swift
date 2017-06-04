//
//  LFBaseVC.swift
//  Lift
//
//  Created by Navya on 5/31/17.
//  Copyright © 2017 RadhikaX M V. All rights reserved.
//

import UIKit

class LFBaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func showTransparentNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true

    }
    
    func addBackLeftButton() {
        let leftButton = UIBarButtonItem(image: UIImage(named:"backArrowButton"), style: .plain, target: self, action: #selector(didPressedBackButton))
        self.navigationItem.leftBarButtonItem  = leftButton

    }
    func addNavigationRightButton() {
        let rightButton = UIBarButtonItem(image: UIImage(named:"Edit"), style: .plain, target: self, action: #selector(didPressedRightButton))
        self.navigationItem.rightBarButtonItem  = rightButton

    }
    
    func didPressedBackButton(_ sender: Any) {}
    
    func didPressedRightButton(_ sender: Any) {}
    

}
