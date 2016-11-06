//
//  MapViewController.swift
//  OutGo
//
//  Created by 胡贝妮 on 2016/11/6.
//  Copyright © 2016年 胡贝妮. All rights reserved.
//

import UIKit
import MapKit
import CoreData
class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    var managedObjectContext: NSManagedObjectContext!
    @IBAction func showUser() {
        let region = MKCoordinateRegionMakeWithDistance(
            mapView.userLocation.coordinate, 1000, 1000)
        mapView.setRegion(mapView.regionThatFits(region), animated: true)
    }
    @IBAction func showLocations() {
    } }
extension MapViewController: MKMapViewDelegate {
}
