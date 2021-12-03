//
//  ContentView.swift
//  UOWRoombooking
//
//  Created by Elroy C. on 11/10/21.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

struct ContentView: View {
    var body: some View {
        VStack{
            HelloText()
            Image("uow-logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
                .padding(.bottom, 75)
            
        }
            }
        }
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HelloText: View {
    var body: some View {
        VStack{
            Text("Welcome back Student!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            
        }
            }
        }
    
