//
//  AvailRmStudentContentView.swift
//  UOW Booking
//
//  Created by Elroy C. on 1/11/21.
//

import SwiftUI

struct AvailRmStudentContentView: View {
    var rooms: [Room] = RoomNumber.currentBookings
    
    var body: some View {
        VStack {
        Spacer()
        NavigationView{
            List {
                ForEach(rooms) { Room in
                    roomCell(room: Room)
                        .swipeActions {
                            Button(role: .destructive) {
                                print("Delete")
                            } label: {
                                Label("Delete", systemImage: "trash.circle.fill")
                            }
                            Button {
                                print("Edit")
                            } label: {
                                Label("Edit", systemImage: "pencil.circle.fill")
                            }
                            .tint(.orange)
                        }
                 /*   .swipeActions{
                        Button {
                            print("Delete")
                        } label: {
                            Label("Delete", systemImage: )
                        } */
        }
      }
            .listStyle(.plain)
      .navigationTitle("My Bookings")
    }
  }
}

struct roomCell: View {
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
                }
            }
        }
    }
}

struct AvailRmStudentContentView_Previews: PreviewProvider {
    static var previews: some View {
        AvailRmStudentContentView()
    }
}
}
