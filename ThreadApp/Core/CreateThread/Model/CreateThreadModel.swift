//
//  CreatePostModel.swift
//  ThreadApp
//
//  Created by Obaro Paul on 11/05/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class CreatePostModel:ObservableObject{
    @Published var currentUser:User?
    
    
        
    func createPost(caption:String) async throws {
        guard let userId = Auth.auth().currentUser?.uid else {return}
        let post = Post(id:NSUUID().uuidString, ownerId: userId, caption: caption, timestamp: Timestamp(), likes: 0)
        try await PostServices.uploadPost(post: post)
    }
    
     func getCurrentUser() {
        self.currentUser =  UserServices.shared.currentUser
    }
    
    
     
    
    
}
