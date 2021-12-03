//
//  MainStudentConentView.swift
//  UOW Booking
//
//  Created by Elroy C. on 1/11/21.
//

import SwiftUI

struct MainStudentConentView: View {
    var body: some View {
        TabView {
               AvailRmStudentContentView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("My Bookings")
                    }
            ViewListofRoomsContentView()
                    .tabItem {
                        Image(systemName: "binoculars.fill")
                        Text("View Available Rooms")
                    }
                StudAccContentView()
                 .tabItem {
                     Image(systemName: "person.crop.circle")
                     Text("Account")
                 }
            }
        }
}


struct MainStudentConentView_Previews: PreviewProvider {
    static var previews: some View {
        MainStudentConentView()
    }
}
