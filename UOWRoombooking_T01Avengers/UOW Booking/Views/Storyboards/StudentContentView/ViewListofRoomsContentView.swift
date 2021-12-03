//
//  ViewListofRoomsContentView.swift
//  UOW Booking
//
//  Created by Elroy C. on 5/11/21.
//

import SwiftUI

struct ViewListofRoomsContentView: View {
    var rooms: [Room] = RoomNumber.approvedRooms
    var body: some View {
        VStack {
        NavigationView{
            List {
                ForEach(rooms) { Room in NavigationLink(destination: RoomView(),  label: {
                    roomsCell(room: Room)
              /*  .swipeActions {
                            Button {
                            
                            } label: {
                                Label("Book Room", systemImage: "checkmark.square.fill")
                            }
                            .tint(.blue)*/
                        })
                      }
                    }
            .listStyle(.plain)
            .navigationTitle("Available Rooms")
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
                
                HStack{
                Text(room.date)
                .font(.subheadline)
                .foregroundColor(.secondary)
                Text(room.quantity)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }            }
         }
      }
  }
struct ViewListofRoomsContentView_Previews: PreviewProvider {
    static var previews: some View {
        ViewListofRoomsContentView()
    }
}
}
