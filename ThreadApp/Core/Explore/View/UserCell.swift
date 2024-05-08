//
//  SearchCell.swift
//  ThreadApp
//
//  Created by Obaro Paul on 01/05/2024.
//

import SwiftUI




struct UserCell: View {
  
    var body: some View {
        HStack{
            CircularImageView()
            
            VStack(alignment:.leading){
//                Text("\()")
                Text("full name")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("Some post here")
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
            }
            
            Spacer()
            
            Button{
                
            }label: {
                Text("Folow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width:100, height:32)
                    .foregroundColor(.black)
                    .overlay{
                        RoundedRectangle(cornerSize: CGSize(width: 10, height:10))
                            .stroke(Color.gray)
                    }
            }
                
        }.padding()
        Divider()
    }
}


#Preview {
    UserCell()
}
