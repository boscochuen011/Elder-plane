//
//  ContentView.swift
//  Elder-plane
//
//  Created by itst on 18/11/2023.
//

import SwiftUI

class PathManager : ObservableObject {
    @Published var path = NavigationPath()
}

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    

    
    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithTransparentBackground()
        tabBarAppearance.backgroundColor = UIColor(red: 115/255, green: 193/255, blue: 175/255, alpha: 1)
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        

       // UITabBar.appearance().unselectedItemTintColor = #colorLiteral(red: 0.8341411948, green: 0.9243671298, blue: 0.9056685567, alpha: 1)
        
        
        //let tabBarAppearance = UITabBarAppearance()
       // tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.8341411948, green: 0.9243671298, blue: 0.9056685567, alpha: 1)]
       // tabBarAppearance.stackedLayoutAppearance.normal.iconColor = #colorLiteral(red: 0.8341411948, green: 0.9243671298, blue: 0.9056685567, alpha: 1)
        
    }
    
    @StateObject var pathManager = PathManager()
    @State var selection : Int = 0
    
    
    
    var body: some View {
        
        TabView (selection: $selection) {
            NavigationStack(path: $pathManager.path)
            {
                DiscoverView()
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Eld-Plane").font(.headline)
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    
            }
            .tag(0)
            .accentColor(.white)
            .tabItem {
                VStack {
                    Image(systemName: "airplane")
                    Text("Discover")
                }
            }
            
            
            
            
            NavigationStack(path: $pathManager.path)
            {
                
                AssistanceView()
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Assistance").font(.headline)
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
            }
            .accentColor(.white)
                .tabItem {
                    VStack {
                        Image(systemName: "airpodsmax")
                            .foregroundStyle(selection == 1 ? .white : .midLightGreen)
                        Text("Assistance")
                            .foregroundStyle(selection == 1 ? .white : .midLightGreen)
                    }
                }
                .tag(1)
            
            
            NavigationStack(path: $pathManager.path)
            {
                
                    MyTripView()
                
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("My Trip").font(.headline)
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
            }
            .accentColor(.white)
            .tabItem {
                    VStack {
                        Image(systemName: "person.fill")
                        Text("My Trips")
                    }
                }
            .tag(2)
        }
        .accentColor(.white)
        .onAppear {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = UIColor(red: 0/255, green: 101/255, blue: 100/255, alpha: 1)
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        
    }
}



struct SecondView: View {
    var body: some View {
        Text("Second View Content")
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
