//
//  ProfilevIewModel.swift
//  ThreadApp
//
//  Created by Obaro Paul on 05/05/2024.
//

import Foundation
import Combine

class ProfilevIewModel:ObservableObject{
    @Published var currentUser:User?
    var userServices = UserServices()
    private var currentUserCancellable = Set<AnyCancellable>()
    init(){
        setupSubscribers() // call the function to get user session
    }
    
    private func setupSubscribers() {
            UserServices.shared.$currentUser.sink { [weak self] user in
                self?.currentUser = user
//                print(" ProfilevIewModel user profile : \(user)")
            }.store(in: &currentUserCancellable)
        }

//         Optionally, if you want to cancel the subscription
//        private func cancelSubscription() {
//            currentUserCancellable?.cancel()
//        }
}
