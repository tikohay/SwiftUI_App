//
//  ActivityView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 15.04.2022.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    
    public var activityItems: [Any]
    public var applicationActivities: [UIActivity]?
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let vc = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) { }
}
