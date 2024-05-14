//
//  Post.swift
//  ThreadApp
//
//  Created by Obaro Paul on 11/05/2024.
//

import Firebase

struct Post:Identifiable, Codable {
    let id: String
    let ownerId:String
    let caption:String
    let timestamp:Timestamp
    var likes:Int
    var user:User?
}
