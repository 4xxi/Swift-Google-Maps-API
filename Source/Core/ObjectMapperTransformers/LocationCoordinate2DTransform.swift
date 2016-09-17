//
//  LocationCoordinate2DTransform.swift
//  GoogleMapsDirections
//
//  Created by Honghao Zhang on 2016-01-23.
//  Copyright © 2016 Honghao Zhang. All rights reserved.
//

import Foundation
import ObjectMapper

class LocationCoordinate2DTransform: TransformType {
    typealias LocationCoordinate2D = GoogleMapsService.LocationCoordinate2D
    typealias Object = LocationCoordinate2D
    typealias JSON = [String : AnyObject]
    
    func transformFromJSON(_ value: Any?) -> Object? {
        if let value = value as? JSON {
            guard let latitude = value["lat"] as? Double, let longitude = value["lng"] as? Double else {
                NSLog("Error: lat/lng is not Double")
                return nil
            }
            
            return LocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        return nil
    }
    
    func transformToJSON(_ value: Object?) -> JSON? {
        if let value = value {
            return [
                "lat" : "\(value.latitude)" as AnyObject,
                "lng" : "\(value.longitude)" as AnyObject
            ]
        }
        return nil
    }
}
