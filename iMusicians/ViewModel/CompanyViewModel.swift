//
//  CompanyViewModel.swift
//  iMusicians
//
//  Created by Angelos Staboulis on 22/5/24.
//

import Foundation
class CompanyViewModel:ObservableObject{
    func createCompany(model:Company){
        DatabaseManager.shared.createCompany(model: model)
    }
   
    func openSelected(companyParameter:Company)->Bool{
        var selected = false
        let companyData = DatabaseManager.shared.fetchCompany()
        for company in companyData{
            if companyParameter.email.count > 0 && companyParameter.password.count > 0 {
                if company.email == companyParameter.email && company.password == companyParameter.password{
                    selected = true
                    break
                }
            }
        }
        return selected
    }
}
