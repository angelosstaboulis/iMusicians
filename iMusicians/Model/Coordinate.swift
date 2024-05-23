//
//  Coordinate.swift
//  iMusicians
//
//  Created by Angelos Staboulis on 23/5/24.
//

import Foundation
import CoreLocation
struct Coordinate:Identifiable{
    let id:UUID
    let name:String
    let coordinate:CLLocationCoordinate2D
}
