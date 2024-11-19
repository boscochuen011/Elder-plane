//
//  SelectBodyWeakness.swift
//  Elder-plane
//
//  Created by Pui Nam Kwok on 18/11/2023.
//

import SwiftUI

struct SelectBodyWeakness: View {
    @State private var showInputMedications = false
    
//    init() {
//        let appearance = UINavigationBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        appearance.backgroundColor = UIColor(red: 0/255, green: 101/255, blue: 100/255, alpha: 1)
//        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//        UINavigationBar.appearance().standardAppearance = appearance
//        UINavigationBar.appearance().scrollEdgeAppearance = appearance
//    }
    
    
    @State private var bodyPart : Int? = nil
    @Binding var isShowAbout : Bool
    
    var body: some View {
        
            VStack {
                Spacer()
                Image(systemName: "2.circle.fill")
                    .font(.system(size: 18))
                    .foregroundColor(Color.midLightGreen)
                Spacer()
                Text("Body Weakness")
                    .font(.system(size: 22,weight: .bold))
                    .foregroundColor(Color.darkGreen)
                    
                
                ZStack(alignment: .leading) {
                    VStack {
                        Spacer()

                        Button(action: {
                            bodyPart = 0
                        }) {
                            HStack {
                                Spacer()
                                Text("Head")
                                    .bold()
                                    .foregroundColor(Color(UIColor(red: 0/255, green: 101/255, blue: 100/255, alpha: 1))) // Change the text color to 006564
                            }
                        }
                        .padding(30)
                        .background(Color(UIColor(red: 236/255, green: 246/255, blue: 245/255, alpha: 1)))
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(bodyPart == 0 ? Color.darkGreen : Color.clear, lineWidth: 2)
                        )

                        Button(action: {
                            bodyPart = 1
                        }) {
                            HStack {
                                Spacer()
                                Text("Upper body")
                                    .bold()
                                    .foregroundColor(Color(UIColor(red: 0/255, green: 101/255, blue: 100/255, alpha: 1))) // Change the text color to 006564
                            }
                        }
                        .padding(30)
                        .background(Color(UIColor(red: 236/255, green: 246/255, blue: 245/255, alpha: 1)))
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(bodyPart == 1 ? Color.darkGreen : Color.clear, lineWidth: 2)
                        )
                        

                        Button(action: {
                            bodyPart = 2
                        }) {
                            HStack {
                                Spacer()
                                Text("Hands")
                                    .bold()
                                    .foregroundColor(Color(UIColor(red: 0/255, green: 101/255, blue: 100/255, alpha: 1))) // Change the text color to 006564
                            }
                        }
                        .padding(30)
                        .background(Color(UIColor(red: 236/255, green: 246/255, blue: 245/255, alpha: 1)))
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(bodyPart == 2 ? Color.darkGreen : Color.clear, lineWidth: 2)
                        )

                        Button(action: {
                            bodyPart = 3
                        }) {
                            HStack {
                                Spacer()
                                Text("Lower body,\nleg & feet")
                                    .bold()
                                    .foregroundColor(Color(UIColor(red: 0/255, green: 101/255, blue: 100/255, alpha: 1))) // Change the text color to 006564
                            }
                        }
                        .padding(30)
                        .background(Color(UIColor(red: 236/255, green: 246/255, blue: 245/255, alpha: 1)))
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(bodyPart == 3 ? Color.darkGreen : Color.clear, lineWidth: 2)
                        )
                        .padding(.bottom, 100)
                        

                        NavigationLink(destination: InputMedications(isShowAbout: $isShowAbout), isActive: $showInputMedications) {
                            EmptyView()
                        }
                        
                        Button(action: {
                            self.showInputMedications = true
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
                        
                        
                    }

                    Image("people")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 170)
                        .clipped()
                        .scaleEffect(x: 2.3, y: 2.3)
                        .offset(x: 55, y: -55)
                }
            }
            .padding()
            .navigationTitle("Your preference")
            .foregroundColor(.white)
            .onAppear(){
                let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = UIColor(red: 0/255, green: 101/255, blue: 100/255, alpha: 1)
                appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
            .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Your preference")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
            
    }
}

struct SelectBodyWeakness_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SelectBodyWeakness(isShowAbout: Binding.constant(true))
        }
    }
}
