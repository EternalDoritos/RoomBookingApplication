//
//  SwiftUIView.swift
//  UOW Booking
//
//  Created by Elroy C. on 30/10/21.
//

import SwiftUI

struct Room: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let date: String
    let quantity: String
}
// total 7 no. of rooms = Emerald, Quartz, Diamond, Jade, Amber, Ruby, Opal, Sapphire
struct RoomNumber {
    
    static let availableRooms = [
        Room(imageName: "workspace_2", title: "Jade", date:"16 November 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_3", title: "Diamond", date: "17 November 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_1", title: "Emerald", date: "20 November 2021", quantity: "Qty: 2")
    ]
    
    static let approvedRooms = [
        Room(imageName: "workspace_2", title: "Amber", date:"25 October 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_3", title: "Diamond", date: "26 October 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_1", title: "Sapphire", date: "27 October 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_2", title: "Quartz", date:"28 October 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_3", title: "Jade", date: "29 October 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_1", title: "Jade", date: "30 October 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_2", title: "Ruby", date:"31 October 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_1", title: "Ruby", date: "1 November 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_2", title: "Opal", date:"2 November 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_3", title: "Diamond", date: "3 November 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_1", title: "Amber", date: "4 November 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_2", title: "Amber", date:"5 November 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_3", title: "Diamond", date: "6 November 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_1", title: "Sapphire", date: "7 November 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_2", title: "Quartz", date:"8 November 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_3", title: "Jade", date: "9 November 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_1", title: "Jade", date: "10 November 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_2", title: "Ruby", date:"11 November 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_1", title: "Ruby", date: "12 November 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_2", title: "Opal", date:"13 November 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_3", title: "Diamond", date: "14 November 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_1", title: "Amber", date: "15 November 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_2", title: "Jade", date:"16 November 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_3", title: "Diamond", date: "17 November 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_1", title: "Emerald", date: "20 November 2021", quantity: "Qty: 2")
    ]
    
    static let currentBookings = [
        Room(imageName: "workspace_1", title: "Jade", date: "16 November 2021", quantity: "Qty: 2"),
    
        Room(imageName: "workspace_2", title: "Amber", date: "18 November 2021", quantity: "Qty: 2"),
        
        Room(imageName: "workspace_3", title: "Rose", date: "20 November 2021", quantity: "Qty: 2")
    ]
}

