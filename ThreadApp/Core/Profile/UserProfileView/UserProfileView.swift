//
//  ProfileView.swift
//  ThreadApp
//
//  Created by Obaro Paul on 01/05/2024.
//

import SwiftUI

struct UserProfileView: View {
    var profileModel = UserProfileModel()
    private var currentUser:User?{
        profileModel.currentUser
    }
    
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    ProfileHeaderView(user:currentUser)
                    
                    //                HStack{
                    //                    Button{}label:{
                    //                        Text("Edit Profile")
                    //                            .fontWeight(.semibold)
                    //                            .font(.subheadline)
                    //                            .frame(width:160, height:34)
                    //                            .foregroundStyle(.black)
                    //                            .overlay{
                    //                                RoundedRectangle(cornerSize: CGSize(width: 10, height:10))
                    //                                    .stroke(Color.gray)
                    //                            }
                    //                    }
                    //
                    //                    Button{}label:{
                    //                        Text("Share Profile")
                    //                            .fontWeight(.semibold)
                    //                            .font(.subheadline)
                    //                            .frame(width:160, height:34)
                    //                            .foregroundStyle(.black)
                    //                            .overlay{
                    //                                RoundedRectangle(cornerSize: CGSize(width: 10, height:10))
                    //                                    .stroke(Color.gray)
                    //                            }
                    //                    }
                    //                }
                    
                    Button{}label:{
                        Text("Edit Profile")
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .font(.subheadline)
                            .frame(width:352, height:32)
                            .foregroundStyle(.black)
                            .background(.white)
//                            .cornerRadius(8)
                            .overlay{
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.systemGray2), lineWidth:1)
                            }
                    }
                    
                    // user content tabbar swipper view (threads, replies)
                    UserContentListView()
                    
                    
                    LazyVStack{
                        ForEach(0..<10, id:\.self){user in
                            FeedCell()
                        }
                    }
                    
                }
            }.navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement:.navigationBarTrailing){
                    Button{
                        AuthServices.shared.SignOut()
                    }label:{
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    UserProfileView()
}
