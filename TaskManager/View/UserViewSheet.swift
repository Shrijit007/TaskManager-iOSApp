//
//  UserViewSheet.swift
//  TaskManager
//
//  Created by Shrijit Raj on 24/04/25.
//

import SwiftUI

struct UserViewSheet: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            Text("Accounts ")
                .font(.title)
                .fontWeight(.medium)
                
            List{
                UserInfoView(img: "Profile",user: "Donald Duck")
                UserInfoView(img: "User1",user: "Bucks Bunny")
                UserInfoView(img: "User2",user: "Tom")
                UserInfoView(img: "User3",user: "Kick Butosky")
            }
            .ignoresSafeArea(.all)
        }
        .padding(.top, 40.0)
    }
}

#Preview {
    UserViewSheet()
}

struct UserInfoView: View {
    var img: String
    var user: String
    var body: some View {
        HStack(spacing: 40) {
            Image(img)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 45, height: 45)
                .clipShape(Circle())
                .background(
                    Circle()
                        .stroke(.black, lineWidth: 5)
                )
            Text(user)
                .font(.headline)
        }
    }
}
