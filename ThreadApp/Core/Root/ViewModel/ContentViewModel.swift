//
//  ContentViewModel.swift
//  ThreadApp
//
//  Created by Obaro Paul on 03/05/2024.
//

import Foundation
import Combine  // listen to when userSession recieve a value
import Firebase

class ContentViewModel :ObservableObject{
    @Published var userSession:FirebaseAuth.User?
    private var cancelable = Set<AnyCancellable>()
    
    init(){
        setupSubscribers() // call the function to get user session
    }
    
    private func setupSubscribers(){
        AuthServices.shared.$userSession.sink{ [weak self] user in
            self?.userSession = user
        }.store(in: &cancelable)
    }
    
    
}
