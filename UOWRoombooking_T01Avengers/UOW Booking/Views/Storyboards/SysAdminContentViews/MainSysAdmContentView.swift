//
//  MainSysAdmContentView.swift
//  UOW Booking
//
//  Created by Elroy C. on 30/10/21.
//

import SwiftUI

struct MainSysAdmContentView: View {
    var body: some View {
        TabView {
               ReqSysAdmnContentView()
                    .tabItem {
                        Image(systemName: "note.text")
                        Text("Requests")
                    }
               ViewAllSysAdmn()
                    .tabItem {
                        Image(systemName: "binoculars.fill")
                        Text("View All")
                    }
                SysAdmAccContentView()
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Account")
                    }      
                }
            }



struct MainSysAdmContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainSysAdmContentView()
    }
}
}
