//
//  UserServices.swift
//  ThreadApp
//
//  Created by Obaro Paul on 05/05/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class UserServices: ObservableObject{
    
    static let shared = UserServices()
    @Published var currentUser:User?
    
    
    
    init(){
        Task{try await fetchCurrentUser()}
    }
    
    private func getCurrentUserId()->String{
        if let userId = Auth.auth().currentUser?.uid {
            return userId
        }else{
            print("No user found")
            return ""
        }
        
        
    }
    
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let userId = Auth.auth().currentUser?.uid else {return} // get current logged in user, if none return.
        
        // <FIRDocumentSnapshot: 0x600003327a20>
        let snapshot = try await Firestore.firestore().collection("users").document(userId).getDocument()
        
        let user =  try snapshot.data(as: User.self)
        self.currentUser = user
    }
    
    
    static func getAllUsers() async throws -> [User] {
        guard let userId = Auth.auth().currentUser?.uid else {return [] } // get current logged in user, if none return.
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
//        print("UserServices  user \(snapshot)")
        let allUsersDocuments = snapshot.documents.compactMap({ try? $0.data(as :User.self)})
//        print("UserServices  user array :  \(allUsersDocuments)")
        return allUsersDocuments.filter({$0.id != userId })
    }
    
    func reset(){
        self.currentUser = nil
    }
    
    
    @MainActor
    func updateUserProfileImage(imageUrl:String) async throws {
        let userId = getCurrentUserId()
        print("current user id \(userId)")
        try await Firestore.firestore().collection("users").document(userId).updateData([
            "profileImageUrl":imageUrl
        ])
        self.currentUser?.profileImageUrl = imageUrl
    }
    
    
}
