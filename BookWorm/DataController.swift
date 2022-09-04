//
//  DataController.swift
//  BookWorm
//
//  Created by Семен Куницын on 24.08.2022.
//
import CoreData
import Foundation


class DataController : ObservableObject {
    
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { description , error in
            if let error = error {
                print("Core data filed to load \(error.localizedDescription)")
            }
        }
    }
}
