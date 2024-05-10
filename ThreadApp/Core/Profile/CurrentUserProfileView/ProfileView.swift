//
//  CurrentUserProfileView.swift
//  ThreadApp
//
//  Created by Obaro Paul on 09/05/2024.
//

import SwiftUI

struct ProfileView: View {
   
    
    @State var user:User
    var body: some View {
        ScrollView{
            VStack{
               ProfileHeaderView(user: user)
                
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
                    Text("Follow")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.subheadline)
                        .frame(width:352, height:32)
                        .foregroundStyle(.black)
                        .background(.black)
                        .cornerRadius(8)
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
//        .toolbar{
//            ToolbarItem(placement:.navigationBarTrailing){
//                Button{
//                    AuthServices.shared.SignOut()
//                }label:{
//                    Image(systemName: "line.3.horizontal")
//                        .foregroundColor(.black)
//                }
//            }
//        }
    }
}

#Preview {
    ProfileView(user: DeveloperPreview.shared.user)
}
