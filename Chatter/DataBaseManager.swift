//
//  DataBaseManager.swift
//  Chatter
//
//  Created by Rachit verma on 21/08/23.
//

import Foundation
import FirebaseDatabase

final class DataBaseManager {
    
    static let shared = DataBaseManager()
    
    private let database = Database.database(url: "https://chatter-c6e8b-default-rtdb.asia-southeast1.firebasedatabase.app").reference()
    
    public func insertUser(with user: ChatterUser){
        
        database.child(user.email).setValue(["uid" : user.uid, "name" : user.name])
        
    }
}

struct ChatterUser{
    let name: String
    let email: String
    let uid: String
}
