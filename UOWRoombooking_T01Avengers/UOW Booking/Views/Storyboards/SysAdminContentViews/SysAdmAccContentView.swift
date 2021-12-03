//
//  SysAdmAccContentView.swift
//  UOW Booking
//
//  Created by Elroy C. on 5/11/21.
//

import SwiftUI

struct SysAdmAccContentView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                VStack {
                Image("sysadm-asset")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .clipped()
                    .padding()
                    
                Text("James Cook")
                        .font(.system(size:25)).bold()
                Text("SYSTEM ADMINISTRATOR")
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
}

struct SysAdmAccContentView_Previews: PreviewProvider {
    static var previews: some View {
        SysAdmAccContentView()
    }
}
}
