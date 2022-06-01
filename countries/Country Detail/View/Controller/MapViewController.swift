//
//  MapViewController.swift
//  countries
//
//  Created by Bahadır Kişisel on 30.05.2022.
//

import UIKit
import MapKit

class MapViewController: BaseViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var navigationTitle: UINavigationItem!
    @IBOutlet weak var closeButton: UIBarButtonItem!
    
    // MARK: - Initializations
    
    private let viewModel: MapViewModel
        
    init(viewModel: MapViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        mapView.centerToLocation(viewModel.location, regionRadius: viewModel.area)
    }
    
    // MARK: - Configuration
    
    private func configure() {
        navigationTitle.title = viewModel.title
    }
    
    // MARK: - IBActions

    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
