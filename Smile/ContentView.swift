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
        userData = [RoomViewModel(room: Room(number: 1, marks: 1)), RoomViewModel(room: Room(number: 2, marks: 0)), RoomViewModel(room: Room(number: 3, marks: 0)), RoomViewModel(room: Room(number: 4, marks: 0)), RoomViewModel(room: Room(number: 5, marks: 0)), RoomViewModel(room: Room(number: 6, marks: 0)), RoomViewModel(room: Room(number: 7, marks: 0)), RoomViewModel(room: Room(number: 8, marks: 0)), RoomViewModel(room: Room(number: 9, marks: 0)), RoomViewModel(room: Room(number: 10, marks: 0))]
    }
}

struct ContentView: View {
    @EnvironmentObject var appData: ApplicationData
    
    var body: some View {
        ScrollView(showsIndicators: false){
            LazyVStack{
                ForEach(appData.userData) { room in
                    VStack(alignment: .leading){
                        Text(String(room.number)).font(.system(size: 80))
                    }
                }
                Spacer()
            }
        }

    }
}
struct CellRoom: View{
    let room: RoomViewModel
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ApplicationData())
    }
}
