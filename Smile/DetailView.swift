//
//  DetailView.swift
//  Smile
//
//  Created by U. Lind Mortensen on 02/08/2023.
//

import SwiftUI

struct DetailView: View {
    let room: RoomViewModel
    
    var body: some View {
        VStack{
            Text(String(room.room.marks))
                .font(.title)
        }.padding()
            .navigationTitle("Detaljer")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(room: ApplicationData().userData[0])
        }
         
    }
}
