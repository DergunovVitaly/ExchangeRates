//
//  LocationViewController.swift
//  ExchangeRates
//
//  Created by  Vitaly Dergunov on 24.12.2019.
//  Copyright © 2019 ExchangeRates. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class LocationViewController: UIViewController {

   private let contentView = MapView()
   private let locationManager = CLLocationManager()
    override func loadView() {
        view = contentView
    }
    
    
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)

//      //Create the pin location of your restaurant(you need the GPS coordinates for this)
//      let restaurantLocation = CLLocationCoordinate2D(latitude: 49.986340, longitude: 36.218870)
//
//      //Center the map on the place location
//      contentView.setCenter(restaurantLocation, animated: true)
   }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.requestAlwaysAuthorization()

        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }

        contentView.delegate = self
        contentView.mapType = .standard
        contentView.isZoomEnabled = true
        contentView.isScrollEnabled = true

        if let coor = contentView.userLocation.location?.coordinate{
            contentView.setCenter(coor, animated: true)
        }
    }
}

extension LocationViewController: CLLocationManagerDelegate, MKMapViewDelegate {
  
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate

        contentView.mapType = MKMapType.standard

        let span = MapKit.MKCoordinateSpan(latitudeDelta: 49.986340, longitudeDelta: 36.218870)
        let region = MKCoordinateRegion(center: locValue, span: span)
        contentView.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
        annotation.title = "My location"
        annotation.subtitle = "current location"
        contentView.addAnnotation(annotation)
        contentView.setCenter(locValue, animated: true)
    }
}
