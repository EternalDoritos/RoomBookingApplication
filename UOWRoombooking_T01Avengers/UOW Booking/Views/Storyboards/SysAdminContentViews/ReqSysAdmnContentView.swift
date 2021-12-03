//
//  ReqSysAdmnContentView.swift
//  UOW Booking
//
//  Created by Elroy C. on 1/11/21.
//

import SwiftUI
import UIKit

struct ReqSysAdmnContentView: View {
    
class CheckBox: UIButton {
        // Images
        let checkedImage = UIImage(named: "ic_check_box")! as UIImage
        let uncheckedImage = UIImage(named: "ic_check_box_outline_blank")! as UIImage
        
        // Bool property
        var isChecked: Bool = false {
            didSet {
                if isChecked == true {
                    self.setImage(checkedImage, for: UIControl.State.normal)
                } else {
                    self.setImage(uncheckedImage, for: UIControl.State.normal)
                }
            }
        }
            
        override func awakeFromNib() {
            self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
            self.isChecked = false
        }
            
        @objc func buttonClicked(sender: UIButton) {
            if sender == self {
                isChecked = !isChecked
            }
        }
    }

    var rooms: [Room] = RoomNumber.availableRooms
    @State private var title: String = ""
    
    var body: some View {
            VStack {
            Spacer()
            NavigationView{
                List {
                    ForEach(rooms) { Room in
                        roomCell(room: Room)
                        }
                          }
                .listStyle(.plain)
                .navigationTitle("Approval Requests")
        }
                Text(title)
                    .foregroundColor(.gray)
                    .font(.caption)
                    .fontWeight(.bold)
                Button(action: {self.title = "Rooms Approved"}, label: {
                    Text("Approve Room")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .padding()
                        .padding(.horizontal, 20)
                        .background(
                            Color.orange
                                .cornerRadius(10)
                                .shadow(radius: 2.5)
                            )
                })
                Spacer(minLength: 60)
      }
    }

    struct roomCell: View {
        
        @State var toggleIsOn: Bool = false
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
                Toggle(
                    isOn: $toggleIsOn) {
                }
                
            }
        }
    }



struct ReqSysAdmnContentView_Previews: PreviewProvider {
    static var previews: some View {
        ReqSysAdmnContentView()
    }
}
}
