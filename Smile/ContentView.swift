//
//  ContentView.swift
//  Smile
//
//  Created by U. Lind Mortensen on 01/08/2023.
//

import SwiftUI

struct Room: Hashable {
    var number: Int
    var marks: Int
    // var smileydate: Date
}

struct RoomViewModel: Identifiable, Hashable {
    let id = UUID()
    var room: Room
    
    var number: Int {
        return room.number
    }
}

class ApplicationData: ObservableObject {
    @Published var userData: [RoomViewModel]
    
    init() {
        userData = [RoomViewModel(room: Room(number: 1, marks: 1)), RoomViewModel(room: Room(number: 2, marks: 0)), RoomViewModel(room: Room(number: 3, marks: 0)), RoomViewModel(room: Room(number: 4, marks: 0)), RoomViewModel(room: Room(number: 5, marks: 0)), RoomViewModel(room: Room(number: 6, marks: 0)), RoomViewModel(room: Room(number: 7, marks: 0)), RoomViewModel(room: Room(number: 8, marks: 0)), RoomViewModel(room: Room(number: 9, marks: 0)), RoomViewModel(room: Room(number: 10, marks: 2))]
    }
}

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
