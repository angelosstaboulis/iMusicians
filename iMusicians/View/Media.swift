//
//  Media.swift
//  iMusicians
//
//  Created by Angelos Staboulis on 23/5/24.
//

import SwiftUI

struct Media: View {
    @StateObject var object = UsersViewModel()
    @State var list:[Users] = []
    @State var filter:[Users] = []
    @State var search:String
    var body: some View {
        NavigationView{
            List(filter.count > 0 ? filter : list,id:\.self){item in
                    NavigationLink {
                        PlayVideo(url: item.media)
                    } label: {
                        VStack{
                                Text(item.lastname).frame(width:200,height:45,alignment: .leading)
                                Text(item.firstname).frame(width:200,height:45,alignment: .leading)
                                Text(item.media).frame(width:200,height:45,alignment: .leading)
                        }
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
    Media(search: "")
}
