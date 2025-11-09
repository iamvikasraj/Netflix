//
//  NetflixApp.swift
//  Netflix
//
//  Created by Vikas Raj Yadav on 18/05/25.
//

import SwiftUI

@main
struct NetflixApp: App {
    @StateObject private var navigationCoordinator = NavigationCoordinator()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(navigationCoordinator)
        }
    }
}
