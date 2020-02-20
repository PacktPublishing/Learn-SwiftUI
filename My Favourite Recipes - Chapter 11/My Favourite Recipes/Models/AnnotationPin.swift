//
//  AnnotationPin.swift
//  My Favourite Recipes
//
//  Created by Chris Barker on 15/01/2020.
//  Copyright © 2020 Packt. All rights reserved.
//

import Foundation
import MapKit

class AnnotationPin: NSObject, MKAnnotation {
    
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, subtitle: String?, coordinate: CLLocationCoordinate2D) {
        
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        
    }
}
