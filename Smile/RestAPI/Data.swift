//
//  Date.swift
//  Smile
//
//  Created by U. Lind Mortensen on 02/08/2023.
//

import Foundation

struct RoomStatus: Hashable, Decodable{
    var number: Int
    var marks: Int
    var smileydate: String
}

struct Response: Hashable, Decodable{
    var rooms: RoomStatus
    
    var number: Int{
        return rooms.number
    }
}





/*
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
*/
class ApplicationData: ObservableObject {
    @Published var userData: [Response] = []
    let url = "http://localhost/smiley/rooms/read.php"
    
    init() {

        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
        guard let data = data, error == nil else{
            print("something get wrong")
            return
        }
        //have data
        var result: Response?
        do{
            result = try JSONDecoder().decode(Response.self, from: data)
        }
        catch{
            print("failed to convert \(error.localizedDescription)")
        }
        
        guard let json = result else{
            return
        }
        
            userData = [Response(rooms: <#T##RoomStatus#>(number: 1, marks: 2, smileydate: "23:"))]
        print (json.rooms.number)
        
    })
        
        /*
        userData = [RoomViewModel(room: Room(number: 1, marks: 1)), RoomViewModel(room: Room(number: 2, marks: 0)), RoomViewModel(room: Room(number: 3, marks: 0)), RoomViewModel(room: Room(number: 4, marks: 0)), RoomViewModel(room: Room(number: 5, marks: 0)), RoomViewModel(room: Room(number: 6, marks: 0)), RoomViewModel(room: Room(number: 7, marks: 0)), RoomViewModel(room: Room(number: 8, marks: 0)), RoomViewModel(room: Room(number: 9, marks: 0)), RoomViewModel(room: Room(number: 10, marks: 2))]*/
    }
 /*
    private func getData(from url: String){
        
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            
            guard let data = data, error == nil else{
                print("something get wrong")
                return
            }
            //have data
            var result: Response?
            do{
                result = try JSONDecoder().decode(Response.self, from: data)
            }
            catch{
                print("failed to convert \(error.localizedDescription)")
            }
            
            guard let json = result else{
                return
            }
            userData = json.rooms
            print (json.rooms.number)
            
        })
    }
    */
    func refresh(room: Int) -> Int{
        print("refresh")
        return room;
    }
}
