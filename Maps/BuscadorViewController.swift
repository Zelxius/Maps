//
//  BuscadorViewController.swift
//  Maps
//
//  Created by Zelxius on 22/03/22.
//

import UIKit
import MapKit

class BuscadorViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var mapa: MKMapView!
    @IBOutlet weak var buscar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buscar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        buscar.resignFirstResponder()
        guard let buscador = buscar.text else { return }
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(buscador) { (places:[CLPlacemark]?, error) in
            if error == nil{
                let place = places?.first
                let anotation = MKPointAnnotation()
                anotation.coordinate = (place?.location?.coordinate)!
                anotation.title = buscador
                
                let region = MKCoordinateRegion(center: anotation.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
                self.mapa.setRegion(region, animated: true)
                self.mapa.addAnnotation(anotation)
                self.mapa.selectAnnotation(anotation, animated: true)
            }else{
                print("Ubicación no encontrada")
            }
        }
    }

}
