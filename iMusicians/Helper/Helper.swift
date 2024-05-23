//
//  Helper.swift
//  iMusicians
//
//  Created by Angelos Staboulis on 23/5/24.
//

import Foundation
import CoreLocation
class Helper{
    static let shared = Helper()
    private init(){}
    func createDate()->String{
        let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "dd/MM/yyyy"
       return dateFormatter.string(from: Date())
    }
    func getCoordinates(address:String) async->CLLocationCoordinate2D{
        return await withCheckedContinuation { continuation in
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(address) { (placemarks, error) in
                continuation.resume(returning: placemarks!.first!.location!.coordinate)
            }
        }
        
    }
}
