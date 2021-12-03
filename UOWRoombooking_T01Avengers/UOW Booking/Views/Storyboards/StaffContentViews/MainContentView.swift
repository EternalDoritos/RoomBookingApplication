//
//  PendingContentView.swift
//  UOW Booking
//
//  Created by Elroy C. on 30/10/21.
//

import SwiftUI

struct MainContentView: View {
    var body: some View {
        TabView {
               ContentView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Add Room")
                            .foregroundColor(.green)
                    }
                PendingContentView()
                    .tabItem {
                        Image(systemName: "clock.arrow.circlepath")
                        Text("Pending")
                    }
                ApprovedContentView()
                    .tabItem {
                        Image(systemName: "checkmark.square")
                        Text("Approved")
                    }
                StaffAccPgContentView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Account")
                }
                }
            }
        }



struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
