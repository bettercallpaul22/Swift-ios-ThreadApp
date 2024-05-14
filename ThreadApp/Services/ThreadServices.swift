//
//  PostServices.swift
//  ThreadApp
//
//  Created by Obaro Paul on 11/05/2024.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase


class PostServices:ObservableObject{
    
    static func uploadPost(post:Post) async throws{
        guard let postData = try? Firestore.Encoder().encode(post) else {return}
        try await Firestore.firestore().collection("posts").addDocument(data: postData)
    }
    
    static func fetchPosts() async throws -> [Post] {
        let snapshot = try await Firestore.firestore().collection("posts").order(by: "timestamp", descending: true).getDocuments()
        print("snapshot: \(snapshot)")
        return snapshot.documents.compactMap({try? $0.data(as:Post.self)})
    }
}
