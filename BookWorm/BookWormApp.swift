//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Семен Куницын on 24.08.2022.
//

import SwiftUI

@main
struct BookWormApp: App {
    
    @State private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
