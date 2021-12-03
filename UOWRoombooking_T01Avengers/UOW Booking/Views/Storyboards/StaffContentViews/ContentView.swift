//
//  ContentView.swift
//  UOW Booking
//
//  Created by Elroy C. on 30/10/21.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State private var roomName = ""
    @State private var bookingCap = 0
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var pricePerBooking = ""
    @State private var promoCode = ""
    @State private var title: String = ""
    var body: some View {
        VStack {
        NavigationView {
        Form {
            Section(header: Text("New room: " + roomName)){
                TextField("Room Name", text: $roomName)
                //when wanting to edit the amount of people to allow inside
                Stepper("Booking Capacity", value: $bookingCap, in: 1...10)
                Text("Total number of Students \(bookingCap)")
                DatePicker("From: ", selection: $startDate, in: Date()...)
                    .padding(5)
                DatePicker("To: ", selection: $endDate, in: Date()...)
                    .padding(5)
                TextField("Price Per Booking", text: $pricePerBooking)
                TextField("Promo Code", text: $promoCode)
            }
        }
        .navigationTitle("Staff Account")
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    hideKeyboard()
                } label: {
                    Image(systemName: "keyboard.chevron.compact.down")
                    }
                }
            }
        }
        .accentColor(.orange)
        .padding()
            Text(title)
                .foregroundColor(.gray)
                .font(.caption)
                .fontWeight(.bold)
            Button(action: {self.title = "Room Launched"}, label: {
                Text("Launch Room")
                    .font(.headline)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(
                        Color.orange                            .cornerRadius(10)
                            .shadow(radius: 2.5)
                        )
            })
Spacer(minLength: 60)
            }
        }
    func saveUser() {
        print("User saved")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

