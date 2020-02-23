//
//  MapView.swift
//  My Favourite Recipes
//
//  Created by Chris Barker on 02/01/2020.
//  Copyright © 2020 Packt. All rights reserved.
//

import SwiftUI
import MapKit

struct RecipeMapView: View {
    
    @ObservedObject var locationManager = MapLocationManager()
    
    @Binding var filter: String
    
    @Environment(\.presentationMode) var presentationMode
    
    private var latitude: Double {
        return locationManager.location?.coordinate.latitude ?? 0.0
    }
    
    private var longitude: Double {
        return locationManager.location?.coordinate.longitude ?? 0.0
    }
    
    var body: some View {
        
        VStack {
            Text("Recipes of the World!")
                .font(.headline)
                .padding()
                .multilineTextAlignment(.leading)
            MapView(lat: latitude,
                    lon: longitude,
                    annotations: Helper.getRecipeLocations(),
                    presentationMode: presentationMode,
                    filter: $filter)
        }
        
        
    }
    
}

struct MapView_Previews: PreviewProvider {
    
    static var previews: some View {
        return RecipeMapView(filter: .constant(""))
    }
}
