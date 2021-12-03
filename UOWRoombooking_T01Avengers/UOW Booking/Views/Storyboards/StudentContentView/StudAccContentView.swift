//
//  StudAccContentView.swift
//  UOW Booking
//
//  Created by Elroy C. on 5/11/21.
//

import SwiftUI

struct StudAccContentView: View {
    var body: some View {
        VStack{
            Spacer()
            HStack{
                
                Spacer()
                VStack {
                Image("student-asset")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .clipped()
                    .padding()
                    
                Text("George Lai")
                        .font(.system(size:25)).bold()
                        .foregroundColor(.black)
                Text("STUDENT")
                            .font(.system(size: 15))
                                .foregroundColor(.gray)
                }
                Spacer()
            }
        
            List{
                Text("Edit Profile")
                Text("Help Center")
                Text("Privacy Policy")
                Text("Sign Out")
                Text("VERSION: 1.2")
            }
            Spacer()
            HStack{
                Image("uow-logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
            }
            Spacer(minLength: 20)
        }
                .background(Color(#colorLiteral(red: 227, green: 253, blue: 253, alpha: 255)))
    }
}

struct StudAccContentView_Previews: PreviewProvider {
    static var previews: some View {
        StudAccContentView()
    }
}
