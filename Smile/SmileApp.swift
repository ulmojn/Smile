//
//  SmileApp.swift
//  Smile
//
//  Created by U. Lind Mortensen on 01/08/2023.
//

import SwiftUI

@main
struct SmileApp: App {
    @StateObject var appData = ApplicationData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appData)
        }
    }
}
