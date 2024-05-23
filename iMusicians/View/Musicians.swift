//
//  Musicians.swift
//  iMusicians
//
//  Created by Angelos Staboulis on 22/5/24.
//

import SwiftUI

struct Musicians: View {
    @StateObject var object = UsersViewModel()
    @State var list:[Users] = []
    @State var filter:[Users] = []
    @State var search:String
    var body: some View {
        NavigationView{
            List{
                ForEach(filter.count > 0 ? filter : list,id:\.self){item in
                    VStack{
                        Text(item.lastname).frame(width:300,height:45,alignment: .leading)
                        Text(item.firstname).frame(width:300,height:45,alignment: .leading)
                        Text(item.town).frame(width:300,height:45,alignment: .leading)
                        Text(item.email).frame(width:300,height:45,alignment: .leading)
                        Text(item.eventdate).frame(width:300,height:45,alignment: .leading)
                    }.frame(width:400,height:230)
                }
            }.onChange(of: search, { oldValue, newValue in
                if filter.count > 0{
                    filter.removeAll()
                    filter = list.filter{$0.firstname == search}
                }else{
                    filter = list.filter{$0.firstname == search}
                }
            })
            .onAppear {
                list = object.fetchUsers()
            }.searchable(text: $search,
                         placement: .navigationBarDrawer(displayMode: .always))
            
           
        }
    }
}

#Preview {
    Musicians(search: "")
}
