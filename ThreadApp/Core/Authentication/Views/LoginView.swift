//
//  LoginView.swift
//  ThreadApp
//
//  Created by Obaro Paul on 30/04/2024.
//

import SwiftUI

struct LoginView: View {
    @State var email:String = ""
    @State var password:String = ""
    var body: some View {
        NavigationStack{
        VStack{
            Spacer()
            Image("thread")
                .resizable()
                .scaledToFill()
                .frame(width:120, height: 120)
            
            VStack(spacing:-10){
                TextField("Enter your email", text: $email)
                    .font(.subheadline)
                    .frame(height:45)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(12)
                    .padding(.horizontal, 12)
                
                SecureField("Enter your password", text: $password)
                    .frame(height:45)
                    .font(.subheadline)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(12)
                    .padding(.horizontal, 12)
                
                
                NavigationLink{
                    Text("Forgot password")
                }label:{
                    Text("Forgot password")
                        .font(.footnote) // make tyhe font smaller
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .frame(maxWidth:.infinity, alignment: .trailing)
                        .padding(.trailing, 24)
                        .padding(.vertical, 20)
                    
                }
                
                Button{
                    
                }label:{
                    Text("Login")
                        .cornerRadius(14)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width:352, height:44)
                    
                        .background(.black)
                        .cornerRadius(10)
                    
                    
                    
                    
                    
                    
                }
                
            }
            Spacer()
            
            Divider()
            
            NavigationLink{
                RegisterView()
            }label: {
                HStack{
                    Text("Don't have an account?")
                    Text("Sign Up")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
            }.padding(.vertical, 20)
            
        }
    }
    }
}

#Preview {
    LoginView()
}
