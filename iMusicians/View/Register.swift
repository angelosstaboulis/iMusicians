//
//  Register.swift
//  iMusicians
//
//  Created by Angelos Staboulis on 22/5/24.
//

import SwiftUI

struct Register: View {
    @State var company:Company
    @StateObject var companyViewModel = CompanyViewModel()
    
    var body: some View {
        ScrollView{
            VStack{
                Text("iMusicians").font(.largeTitle).foregroundStyle(.blue)
                VStack{
                    Image("iMusicians").resizable().frame(width:100,height:95)
                }.padding(15)
                VStack{
                    VStack{
                        Text("Company Name").frame(width:200,alignment: .leading)
                        TextField("Enter your Company Name", text: $company.name).frame(width:200,alignment: .leading)
                    }.padding(27)
                    VStack{
                        Text("Company Type").frame(width:200,alignment: .leading)
                        TextField("Enter your Company Type", text: $company.type).frame(width:200,alignment: .leading)
                    }.padding(27)
                    VStack{
                        Text("Company Owner").frame(width:200,alignment: .leading)
                        TextField("Enter your Company Owner", text: $company.fullname).frame(width:200,alignment: .leading)
                    }.padding(27)
                    VStack{
                        Text("Company Address").frame(width:200,alignment: .leading)
                        TextField("Enter your Company Address", text: $company.address).frame(width:200,alignment: .leading)
                    }.padding(27)
                    VStack{
                        Text("Email").frame(width:200,alignment: .leading).autocapitalization(.none)
                        TextField("Enter your Company Email", text: $company.email).frame(width:200,alignment: .leading).autocapitalization(.none)
                    }.padding(27)
                    VStack{
                        Text("Password").frame(width:200,alignment: .leading)
                        TextField("Enter your Password", text: $company.password).frame(width:200,alignment: .leading)
                    }.padding(27)
                    VStack{
                        Text("Town").frame(width:200,alignment: .leading)
                        TextField("Enter your Company Town", text: $company.town).frame(width:200,alignment: .leading)
                    }.padding(27)
                    VStack{
                        Button(action: {
                            companyViewModel.createCompany(model: company)
                        }, label: {
                            Text("Create Account").foregroundStyle(.white)
                        }).background {
                            RoundedRectangle(cornerRadius: 22.0).frame(width:300,height:45)
                                .foregroundStyle(.blue)
                        }.padding(15)
                        
                    }
                    
                }.frame(height:960,alignment:.center)
                Spacer()
            }.frame(width:900,height:1200)
        }
    }
}

#Preview {
    Register(company: .init(id: 0, name: "", type: "", fullname: "", address: "", town: "", email: "", password: ""))
}
