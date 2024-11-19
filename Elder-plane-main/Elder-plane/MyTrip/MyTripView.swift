//
//  ContentView.swift
//  map
//
//  Created by Yip Cheuk Wing on 18/11/2023.
//

import SwiftUI
import MapKit

struct MyTripView: View {
//    
//    init() {
//        let tabBarAppearance = UITabBarAppearance()
//        tabBarAppearance.configureWithTransparentBackground()
//        tabBarAppearance.backgroundColor = UIColor(red: 115/255, green: 193/255, blue: 175/255, alpha: 1)
//        
//        UITabBar.appearance().standardAppearance = tabBarAppearance
//        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
//        
//
//        UITabBar.appearance().unselectedItemTintColor = #colorLiteral(red: 0.8341411948, green: 0.9243671298, blue: 0.9056685567, alpha: 1)
//        
//        
//        //let tabBarAppearance = UITabBarAppearance()
//        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.8341411948, green: 0.9243671298, blue: 0.9056685567, alpha: 1)]
//        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = #colorLiteral(red: 0.8341411948, green: 0.9243671298, blue: 0.9056685567, alpha: 1)
//        
//    }
    
    @State private var cameraPosistion: MapCameraPosition = .region(.userRegion)
    @State private var searchText = ""
    @State private var results = [MKMapItem]()
    @State private var mapSelection: MKMapItem?
    @State private var showDetails = false
    @State private var getDirections = false
    @State private var routeDisplaying = false
    @State private var route: MKRoute?
    @State private var routeDestination: MKMapItem?
    
    var body: some View {
        VStack {
            
            Text("hihi")
            
            Map(position: $cameraPosistion, selection: $mapSelection) 
            {
                
                Annotation("My location", coordinate: .userLocation) {
                    ZStack {
                        Circle()
                            .frame(width: 32, height: 32)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/.opacity(0.25))
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                        Circle()
                            .frame(width: 14, height: 14)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                }
                ForEach(results, id: \.self) { item in
                    if routeDisplaying {
                        if item == routeDestination {
                            let placemark = item.placemark
                            Marker(placemark.name ?? "", coordinate: placemark.coordinate)
                        } else {
                            let placemark = item.placemark
                            Marker(placemark.name ?? "", coordinate: placemark.coordinate)
                        }
                    }
                    let placemark = item.placemark
                    Marker(placemark.name ?? "", coordinate: placemark.coordinate)
                }
                if let route {
                    MapPolyline(route.polyline)
                        .stroke(.blue, lineWidth: 6)
                }
            }

            
        }
        
        .overlay(alignment: .top) {
            TextField("Search for a location...", text: $searchText)
                .font(.subheadline)
                .padding(12)
                .background(.white)
                .padding()
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
        .onSubmit(of: .text) {
            Task { await searchPlaces() }
        }
        .onChange(of: getDirections, {oldValue, newValue in
            if newValue {
                fetchRoute()
            }
        })
        .onChange(of: mapSelection, { oldValue, newValue in
            showDetails = newValue != nil
        })
        .sheet(isPresented: $showDetails, content: {
            LocationDetailsView(mapSelection: $mapSelection, show: $showDetails, getDirections: $getDirections)
                .presentationDetents([.height(340)])
                .presentationBackgroundInteraction(.enabled(upThrough: .height(340)))
                .presentationCornerRadius(12)
        })
        .mapControls{
            MapCompass()
            MapPitchToggle()
            MapUserLocationButton()
        }
        .toolbarBackground(Color(uiColor: UIColor(red: 0/255, green: 101/255, blue: 100/255, alpha: 1)), for: .navigationBar)
        .toolbarBackground(Color(uiColor: #colorLiteral(red: 0.4499112964, green: 0.7566919327, blue: 0.6881037354, alpha: 1)), for: .tabBar)
        .foregroundColor(.white)
        .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("My Trips")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
        

    }
}

extension MyTripView {
    func searchPlaces() async {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        request.region = .userRegion
        
        let results = try? await MKLocalSearch(request: request).start()
        self.results = results?.mapItems ?? []
    }
    
    func fetchRoute() {
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: .init(coordinate: .userLocation))
        request.destination = mapSelection
        
        Task {
            let result = try? await MKDirections(request: request).calculate()
            route = result?.routes.first
            routeDestination = mapSelection
            
            withAnimation(.snappy) {
                routeDisplaying = true
                showDetails = false
                
                if let rect = route?.polyline.boundingMapRect, routeDisplaying {
                    cameraPosistion = .rect(rect)
                }
            }
        }
    }
}

extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        return .init(latitude: 22.2974, longitude: 113.9344)
    }
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return .init(center: .userLocation,
                     latitudinalMeters: 10000,
                     longitudinalMeters: 10000)
    }
}

#Preview {
    NavigationStack {
        MyTripView()
    }
    
}
