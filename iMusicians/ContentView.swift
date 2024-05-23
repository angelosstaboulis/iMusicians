//
//  ContentView.swift
//  iMusicians
//
//  Created by Angelos Staboulis on 22/5/24.
//

import SwiftUI

struct ContentView: View {
    @State var company:Company
    @State var companyViewModel:CompanyViewModel
    var body: some View {
        NavigationView{
            VStack{
                Text("iMusicians").font(.largeTitle).foregroundStyle(.blue)
                VStack{
                    VStack{
                        Image("iMusicians").resizable()
                    }.padding(27)
                    VStack{
                        Text("Email").frame(width:200,alignment: .leading)
                        TextField("Enter your Email", text: $company.email).frame(width:200,alignment: .leading).autocapitalization(.none)
                       
                    }.padding(27)
                    VStack{
                        Text("Password").frame(width:200,alignment: .leading)
                      
                        SecureField("Enter your Password", text: $company.password).frame(width:200,alignment: .center).autocapitalization(.none)
                        
                    }.padding(27)
                    VStack{
                        NavigationLink {
                            if companyViewModel.openSelected(companyParameter: company){
                                MainMenu()
                            }
                        } label: {
                            Text("Login").foregroundStyle(.white)
                                
                        }.background {
                            RoundedRectangle(cornerRadius: 22.0).frame(width:300,height:45)
                                .foregroundStyle(.blue)
                        }.padding(15)
                        VStack{
                            NavigationLink {
                                Register(company: .init(id: 0, name: "", type: "", fullname: "", address: "", town: "", email: "", password: ""))
                            } label: {
                                Text("Register").foregroundStyle(.blue)
                            }

                           
                        }
                    }
                  
                }.frame(height:670,alignment:.center)
               
                Spacer()
            }.frame(maxWidth: .infinity)
           
           
        }
    }
}

#Preview {
    ContentView(company: .init(id: 0, name: "", type: "", fullname: "", address: "", town: "", email: "", password: ""), companyViewModel: .init())
}
