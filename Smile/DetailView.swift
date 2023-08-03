//
//  DetailView.swift
//  Smile
//
//  Created by U. Lind Mortensen on 02/08/2023.
//

import SwiftUI

struct DetailView: View {
    let room: Response
    @EnvironmentObject var appData: ApplicationData
    // Read day status from RESTAPI for this room ""room.number"
    //
    
        
    var body: some View {
        VStack{
            Text(String(room.rooms.number))
                .font(.title)
            Text(String(room.rooms.marks))
            Text(String(appData.refresh(room: 4)))
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
