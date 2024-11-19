//
//  SelectTypeView.swift
//  Elder-plane
//
//  Created by Pui Nam Kwok on 18/11/2023.
//

import SwiftUI

extension Color {
    static var darkGreen : Color {
        return Color(uiColor: #colorLiteral(red: 0.006937109865, green: 0.3944100738, blue: 0.3911792636, alpha: 1))
    }
    static var midLightGreen : Color {
        return Color(uiColor: #colorLiteral(red: 0.4499112964, green: 0.7566919327, blue: 0.6881037354, alpha: 1))
    }
}


struct TravelType: Hashable {
    let name: String
    let icon1: String
    let icon2: String
}


struct SelectTypeView: View {
    
    @State private var selectedTravelType: TravelType? = nil
    @State private var isNextPageShown = false
    
    @Binding var isShowAbout : Bool
    
    var body: some View {
        
        VStack {
            Spacer()
            Image(systemName: "1.circle.fill")
                .font(.system(size: 18))
                .foregroundColor(Color.midLightGreen)
            Spacer()
            Text("Types of Travel")
                .font(.system(size: 22,weight: .bold))
                .foregroundColor(Color.darkGreen)
                
            
            Spacer()
            ScrollView {
                ForEach(travelTypes, id: \.self) { 
                    type in
                    Button(action: {
                        selectedTravelType = type
                    }) {
                        HStack {
                            Image(systemName: type.icon1)
                                .foregroundColor(Color.darkGreen)
                                .font(.system(size: 25, weight: .bold))
                                .padding(.leading, 10)
                            
                            Circle()
                                .fill(.white)
                                .frame(width: 110, height: 110)
                                .overlay(content: {
                                    Image(type.icon2)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 80, height: 80)
                                        .clipShape(Circle())
                                })
                            
                            
                            Text(type.name)
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color.darkGreen)
                                .padding(.horizontal, 10)
                                .bold()
                            Spacer()
                        }
                        .padding(.vertical, 15)
                        .padding(.horizontal, 15)
                        .background(Color(hex: "ECF6F5"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(type == selectedTravelType ? Color.darkGreen : Color.clear, lineWidth: 4)
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                    .cornerRadius(20)
                    .padding(.vertical, 5)
                }
            }
            Spacer()
            
            NavigationLink(destination: SelectBodyWeakness(isShowAbout: $isShowAbout), isActive: $isNextPageShown) {
                EmptyView()
            }
            
            Button(action: {
                self.isNextPageShown = true
            }) {
                ZStack {
                    HStack {
                        Text("Next")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                    }
                    HStack {
                        Spacer()
                        Image(systemName: "arrow.right")
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .bold))
                            .padding(20)
                    }
                }
            }
            .frame(height: 75)
            .background(Color(hex: "73C1AF"))
            .cornerRadius(23)
            .padding(.horizontal)
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Your Preference").font(.headline).foregroundColor(.white)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Eld-Plane").font(.headline)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .onAppear {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = UIColor(Color(hex: "006564"))
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
}

let travelTypes = [
    TravelType(name: "Exploration", icon1:"gauge.with.dots.needle.bottom.100percent", icon2: "Exploration"),
    TravelType(name: "Cultural travel", icon1:"gauge.with.dots.needle.bottom.50percent", icon2: "Cultural travel"),
    TravelType(name: "Free & slow", icon1:"gauge.with.dots.needle.bottom.0percent", icon2: "Free & slow")
]

struct SelectTypeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SelectTypeView(isShowAbout: Binding.constant(true))
        }
    }
}
