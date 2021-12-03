//
//  ViewAllSysAdmn.swift
//  UOW Booking
//
//  Created by Elroy C. on 1/11/21.
//

import SwiftUI

struct ViewAllSysAdmn: View {
    var rooms: [Room] = RoomNumber.approvedRooms
    var body: some View {
        VStack {
        NavigationView{
            List {
                ForEach(rooms) { Room in
                    roomsCell(room: Room)
                        .swipeActions {
                            Button(role: .destructive) {
                                print("View")
                            } label: {
                                Label("View Room", systemImage: "binoculars.fill")
                            }
                            .tint(.green)
                        }
                      }
                    }
            .listStyle(.plain)
            .navigationTitle("Approved Bookings")
                }
        }
    }

    struct roomsCell: View {
        var room: Room
        var body: some View {
            HStack {
                Image(room.imageName)
                    .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .cornerRadius(4)
                        .padding(.vertical, 5)
                VStack(alignment: .leading, spacing: 5){
                    Text(room.title)
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                    
                    Text(room.date)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
             }
          }
      }
struct ViewAllSysAdmn_Previews: PreviewProvider {
    static var previews: some View {
        ViewAllSysAdmn()
    }
}
}
