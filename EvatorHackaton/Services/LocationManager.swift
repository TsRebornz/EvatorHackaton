//
//  LocationManager.swift
//  EvatorHackaton
//
//  Created by user name on 30/11/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import UIKit
import CoreLocation

final class LocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    public let manager = CLLocationManager()
    private var currentLocation: CLLocation?
    private var noGeoCounter = 0
    private let geoFailsLimit = 10
    
    private override init() {
        super.init()
        
        manager.delegate = self
        manager.desiredAccuracy = 100.0
        manager.requestWhenInUseAuthorization()
    }
    
    func getLocation() -> CLLocation? {
        guard let curLoc = self.currentLocation else {
            noGeoCounter += 1
            requestLocation()
            guard noGeoCounter < geoFailsLimit else {
                return nil
            }
            return nil
        }        
        return curLoc
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    
    func returnDistanceFromPointInKmToUserLocation(point: CLLocationCoordinate2D ) -> Double? {
        let pointLocation = CLLocation(latitude: point.latitude, longitude: point.longitude)
        guard let location = self.currentLocation else  {
            return nil
        }
        let distanceInMeters = location.distance(from: pointLocation)
        let distanceInKm = distanceInMeters / 1000
        return distanceInKm
    }
    
    //MARK: Location manager
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
            manager.startUpdatingHeading()
        } else if status == .authorizedAlways {
            manager.requestLocation()
        } else if status == .notDetermined {
            print("User access to location services not determined")
        } else if status == .restricted {
            print("User restricted access to location services")
            manager.requestWhenInUseAuthorization()
        } else if status == .denied {
            print("User denies access to location services")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firtLocation = locations.first {
            self.noGeoCounter = 0
            self.currentLocation = firtLocation
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location shit happens \(error.localizedDescription)")
    }
    
    //MARK:
}
