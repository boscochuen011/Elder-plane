//
//  AIContainer.swift
//  Elder-plane
//
//  Created by Yu Ho Kwok on 11/19/23.
//

import SwiftUI


struct AIContainer : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> MainViewController {
        return UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AIViewController") as! MainViewController
    }
    
    func updateUIViewController(_ uiViewController: MainViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = MainViewController
    
    
}
