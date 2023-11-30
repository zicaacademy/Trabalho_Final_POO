//
//  CloudKitCRUD.swift
//  Trabalho_Final_POO
//
//  Created by Luiz Felipe on 29/11/23.
//

import Foundation
import CloudKit

class CloudKitCRUD:ObservableObject{
    
    init() {
        getIcloudStatus()
    }
    
    internal func saveItem(record:CKRecord){
        CKContainer(identifier: "iCloud.uikittestes.Trabalho-Final-POO").publicCloudDatabase.save(record) {[weak self] returnedRecord, returnedError in
            print("retorno do salvamento \(returnedRecord?.description)")
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self?.fetchItems()
            }
        }
    }
    
    internal func fetchItems(){
        //filtro da pesquisa, nesse caso estando true retornara todos os items
        print("fetchItems sucess")
    }
    
}
internal func addOperation(operation:CKDatabaseOperation){
    CKContainer(identifier: "iCloud.uikittestes.Trabalho-Final-POO").publicCloudDatabase.add(operation)
}



private func getIcloudStatus(){
    CKContainer.default().accountStatus {retunedStatus, returnedError in
        DispatchQueue.main.async {
            switch retunedStatus{
            case .available:
                print("Esta conectado ao ICloud")
            case .noAccount:
                print(CloudKitError.iCloudAccountNotFound.rawValue)
            case .couldNotDetermine:
                print(CloudKitError.iCloudAccountNotDetermine.rawValue)
            case .restricted:
                print(CloudKitError.iCloudAccountRestricted.rawValue)
            default:
                print(CloudKitError.iCloudAccountUnknown.rawValue)
            }
        }
    }
}

enum CloudKitError:String,LocalizedError{
    case iCloudAccountNotFound
    case iCloudAccountNotDetermine
    case iCloudAccountRestricted
    case iCloudAccountUnknown
    
}

