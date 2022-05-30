//
//  MapViewController.swift
//  countries
//
//  Created by Bahadır Kişisel on 30.05.2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var closeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
    }
    

}
