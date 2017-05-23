//
//  HomeViewController.swift
//  Lift
//
//  Created by Venkatesh M on 11/05/17.
//  Copyright © 2017 RadhikaX M V. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class HomeViewController: UIViewController {
    
    var profileButton = UIBarButtonItem()
    var routeButton = UIBarButtonItem()
    var menuButton = UIBarButtonItem()
    
    var isViewHidden = true
    
    //Maps
    ////////////////////////////////////////////////////////////////////
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    
    // An array to hold the list of likely places.
    var likelyPlaces: [GMSPlace] = []
    
    // The currently selected place.
    var selectedPlace: GMSPlace?
    
    let marker = GMSMarker()
    
    ////////////////////////////////////////////////////////////////////
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressView: UIView!
    
    @IBOutlet weak var googleMap: GMSMapView!
    @IBOutlet weak var placeTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
         let size = CGSize(width: 0, height: 4)
        
        placeTextField?.layer.cornerRadius=5.0;
        placeTextField?.layer.masksToBounds=true;
        placeTextField?.layer.shadowColor = UIColor.gray.cgColor
        placeTextField?.layer.shadowOffset = CGSize(width: 0, height: 2)
        placeTextField?.layer.shadowRadius = 10
        placeTextField?.layer.shadowOpacity = 1
        placeTextField?.layer.masksToBounds=false
        
//        placeTextField.attributedPlaceholder = NSAttributedString(string: "Where you would like to go?",
//                                                               attributes: [NSForegroundColorAttributeName: UIColor.init(netHex: 0x00A6AC)])
        
        let btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "profileIcon2"), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        btn1.addTarget(self, action: #selector(profileAction), for: .touchUpInside)
        btn1.layer.shadowColor = UIColor.gray.cgColor
        btn1.layer.shadowOffset = size
        btn1.layer.shadowRadius = 2
        btn1.layer.shadowOpacity = 1
        btn1.layer.masksToBounds=false
        profileButton = UIBarButtonItem(customView: btn1)
        
        let btn2 = UIButton(type: .custom)
        btn2.setImage(UIImage(named: "routeIcon2"), for: .normal)
        btn2.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        btn2.addTarget(self, action: #selector(profileAction), for: .touchUpInside)
        btn2.layer.shadowColor = UIColor.gray.cgColor
        btn2.layer.shadowOffset = size
        btn2.layer.shadowRadius = 2
        btn2.layer.shadowOpacity = 1
        btn2.layer.masksToBounds=false
        routeButton = UIBarButtonItem(customView: btn2)
        
        let btn3 = UIButton(type: .custom)
        btn3.setImage(UIImage(named: "liftMenu2"), for: .normal)
        btn3.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        btn3.addTarget(self, action: #selector(profileAction), for: .touchUpInside)
        btn3.layer.shadowColor = UIColor.gray.cgColor
        btn3.layer.shadowOffset = size
        btn3.layer.shadowRadius = 2
        btn3.layer.shadowOpacity = 1
        btn3.layer.masksToBounds=false
        menuButton = UIBarButtonItem(customView: btn3)
        
        self.navigationItem.setRightBarButtonItems([profileButton,routeButton], animated: true)
        
        self.navigationItem.setLeftBarButton(menuButton, animated: true)
        
         if revealViewController() != nil {
            self.revealViewController().rearViewRevealWidth = self.view.frame.size.width-50;
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        }
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
    
        placesClient = GMSPlacesClient.shared()
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(self.wasDragged(gestureRecognizer:)))
        addressView.addGestureRecognizer(gesture)
        addressView.isUserInteractionEnabled=true
        gesture.delegate = self
        
        addressView.frame.origin.y=self.view.frame.maxY-34
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    func wasDragged(gestureRecognizer: UIPanGestureRecognizer) {
      /*  if gestureRecognizer.state == UIGestureRecognizerState.began || gestureRecognizer.state == UIGestureRecognizerState.changed {
            print("gesture moving");
            let translation = gestureRecognizer.translation(in: self.view)
//            print(gestureRecognizer.view!.center.y)
            print(gestureRecognizer.view!.frame.origin.y,self.view.frame.maxY-addressView.frame.size.height)
            if(gestureRecognizer.view!.frame.origin.y > self.view.frame.maxY-addressView.frame.size.height) {
                print("gesture entered");
//                gestureRecognizer.view!.center = CGPoint(x:gestureRecognizer.view!.center.x, y:gestureRecognizer.view!.center.y + translation.y)
                
                addressView.frame.origin.y=self.view.frame.maxY-17
                
                
            }else {
//                print("gesture stopped");
//                gestureRecognizer.view!.center = CGPoint(x:gestureRecognizer.view!.center.x,y:view.frame.maxY-gestureRecognizer.view!.frame.size.height/2)
                
                addressView.frame.origin.y=self.view.frame.maxY-addressView.frame.size.height
            }
            
            gestureRecognizer.setTranslation(CGPoint(x:0,y:0), in: self.view)
        }
        */
        
        if isViewHidden{
            isViewHidden = false
            addressView.frame.origin.y=self.view.frame.maxY-34
        }else{
            isViewHidden = true
            addressView.frame.origin.y=self.view.frame.maxY-addressView.frame.size.height
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.isEditing=false;
    }
    
    // MARK: Route
    
    @IBAction func routeAction(_ sender: Any) {
    }
    
    // MARK: Profile
    
    @IBAction func profileAction(_ sender: Any) {
        revealViewController().revealToggle(sender)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
   

}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
extension HomeViewController: UIGestureRecognizerDelegate {
}
// MARK: - CLLocationManagerDelegate
//1
extension HomeViewController: CLLocationManagerDelegate {
    
    // Handle incoming location events.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        print("Location: \(location)")
        
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude,
                                              zoom: 15)
        
        if googleMap.isHidden {
            googleMap.isHidden = false
            googleMap.camera = camera
        } else {
            googleMap.animate(to: camera)
            
            marker.position = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            //marker.appearAnimation = kGMSMarkerAnimationPop
            marker.snippet="my location"
            marker.icon = UIImage(named: "user_marker")
            marker.map = googleMap
            
//            placesClient.currentPlace(callback: { (placeLikelihoodList, error) -> Void in
//                if let error = error {
//                    print("Pick Place error: \(error.localizedDescription)")
//                    return
//                }
//                
//                if let placeLikelihoodList = placeLikelihoodList {
//                    for likelihood in placeLikelihoodList.likelihoods {
//                        let place = likelihood.place
//                        print("Current Place name \(place.name) at likelihood \(likelihood.likelihood)")
//                    
//                        self.addressLabel?.text = place.formattedAddress
//            
//                        print("Current Place address \(String(describing: place.formattedAddress))")
//                        print("Current Place attributions \(String(describing: place.attributions))")
//                        print("Current PlaceID \(place.placeID)")
//                    }
//                }
//            })
            
            placesClient.currentPlace(callback: { (placeLikelihoodList, error) -> Void in
                if let error = error {
                    print("Pick Place error: \(error.localizedDescription)")
                    return
                }
                
                self.nameLabel?.text = "No current place"
                self.addressLabel?.text = ""
                
                if let placeLikelihoodList = placeLikelihoodList {
                    let place = placeLikelihoodList.likelihoods.first?.place
                    if let place = place {
                        self.nameLabel?.text = place.name
                        self.addressLabel?.text = place.formattedAddress?.components(separatedBy: ", ")
                            .joined(separator: "\n")
                    }
                }
            })
            
        }
        
       // listLikelyPlaces()
    }
    
    // Handle authorization for the location manager.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            // Display the map using the default location.
            googleMap.isHidden = false
        case .notDetermined:
            print("Location status not determined.")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
        }
    }
    
    // Handle location manager errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
    }
}
