//
//  SearchViewModel.swift
//  ThreadApp
//
//  Created by Obaro Paul on 06/05/2024.
//

import Foundation

class ExploreViewModel:ObservableObject{
    static let shared = ExploreViewModel()
//    @Published var allUsers:[User] = []
    @Published var users = [User]()
    
    
    init(){
        Task{try await getAllUsers()}
    }
    
    private func getAllUsers() async throws{
        self.users = try await UserServices.getAllUsers()
        print("All users-----> \(users)")
    }
    
}
