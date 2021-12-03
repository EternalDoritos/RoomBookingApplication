//
//  RoomView.swift
//  UOW Booking
//
//  Created by Elroy C. on 30/10/21.
//

import SwiftUI

struct RoomView: View {
    @State private var roomName = ""
    @State private var bookingCap = 1
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var pricePerBooking = 9
    @State private var promoCode = ""
    @State private var title: String = ""
    var body: some View {
        
        let promo = 0.9
       // let priceAfterPromo = round((promo * Double(pricePerBooking)) * 100) / 100.0
        let finalPrice = pricePerBooking * bookingCap
        
        VStack(spacing: 5) {
            Spacer(minLength: 10)
            Image("workspace_1")
                .resizable()
                .scaledToFit()
                .frame(height: 190)
                .cornerRadius(12)
            
            Text("Emerald")
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            HStack {
                Text("20 November     Qty: 2")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Form {
                Section(header: Text("New room: " + roomName)){
                    //when wanting to edit the amount of people to allow inside
                    Stepper("Booking Time:", value: $bookingCap, in: 1...8)
                    Text("Time Allocated: \(bookingCap) hrs")
                    Text("Price Per Booking: $ \(finalPrice)")
                    TextField("Promo Code", text: $promoCode)
                    if promoCode == ""{
                    }
                    Text("Price after Promo: $ \(promo * Double(finalPrice))")
                   // TextField("Final Price")
                } 
            }
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        hideKeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                        }
                    }
                }
            .accentColor(.orange)
            .padding()
                Text(title)
                    .foregroundColor(.gray)
                    .font(.caption)
                    .fontWeight(.bold)
                Button(action: {self.title = "Room Confirmed"}, label: {
                    Text("Pay")
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
            Spacer(minLength: 40)
        }
}
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView()
    }
}
