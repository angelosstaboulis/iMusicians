//
//  MapUIView.swift
//  iMusicians
//
//  Created by Angelos Staboulis on 23/5/24.
//

import SwiftUI
import CoreLocation
import MapKit

struct MapUIView: View {
    @StateObject var object = UsersViewModel()
    @State var list:[Users] = []
    @State var coordinate:[Coordinate] = []
    var body: some View {
        Map{
            ForEach(coordinate) { item in
                Marker(coordinate: item.coordinate) {
                    Text(item.name)
                }
            }
        }.onAppear {
            Task{
                list = object.fetchUsers()
                for item in list{
                    coordinate.append(Coordinate(id: UUID(), name:item.lastname + "," + item.firstname ,coordinate: await Helper.shared.getCoordinates(address: item.town)))
                }
            }
        }
    }
}

#Preview {
    MapUIView()
}
