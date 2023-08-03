//
//  ContentView.swift
//  Smile
//
//  Created by U. Lind Mortensen on 01/08/2023.
//

import SwiftUI


 
struct ContentView: View {
    @EnvironmentObject var appData: ApplicationData
    
    var body: some View {
        NavigationStack{
            ScrollViewReader{ proxy in
                List(appData.userData) { room in
                    NavigationLink(destination: {
                        DetailView(room: room)
                    }, label: {
                        CellRoom(room: room)
                        .id(room.id)
                    })
                    
                }
                .navigationTitle(Text("Rooms"))
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing){
                        Button(action: {
                            if let lastIndex = appData.userData.first?.id{
                                proxy.scrollTo(lastIndex, anchor: .bottom)
                            }
                        }, label:{ Image(systemName: "arrow.up.doc")})
                        Button(action: {
                            if let lastIndex = appData.userData.last?.id{
                                proxy.scrollTo(lastIndex, anchor: .bottom)
                            }
                        }, label:{ Image(systemName: "arrow.down.doc")})
                    }
                }
            }
        }
    }
}
struct CellRoom: View{
    let room: RoomViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text(String(room.number)).font(.system(size: 80))
        }
    }
}
 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ApplicationData())
    }
}
