//
//  CasaCRUD.swift
//  Trabalho_Final_POO
//
//  Created by Luiz Felipe on 30/11/23.
//

import Foundation
import CloudKit

class CasaCRUD:CloudKitCRUD{
    @Published var casa: [CasaModel] = []

      func addButtomPressed(cep: Int, endereco: String, numero: Int, preco: Double, area_total: Double,num_quartos: Int, num_andares: Int, num_banheiros: Int, possui_garagem: Bool){
        
        addItem(cep: cep, endereco: endereco, numero: numero, preco: preco, area_total: area_total,num_quartos: num_quartos, num_andares: num_andares, num_banheiros: num_banheiros, possui_garagem: possui_garagem)
    }
    
    
    private func addItem(cep: Int, endereco: String, numero: Int, preco: Double, area_total: Double,num_quartos: Int, num_andares: Int, num_banheiros: Int, possui_garagem: Bool){
        //tipo do dado adicionado
        var newImovel = CKRecord(recordType: "casa")
            newImovel["cep"] = cep
            newImovel["endereco"] = endereco
            newImovel["numero"] = numero
            newImovel["preco"] = preco
            newImovel["area_total"] = area_total
            newImovel["num_quartos"] = num_quartos
            newImovel["num_banheiros"] = num_banheiros
            newImovel["num_andares"] = num_andares
            newImovel["possui_garagem"] = possui_garagem
    
        saveItem(record: newImovel)
    }
    
    override internal func fetchItems(){
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "casa", predicate: predicate)
        
        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true )]
        let queryOperation = CKQueryOperation(query: query )
        
        var returnedApItems:[CasaModel] = []
        
        queryOperation.recordMatchedBlock = {(returnedRecordId, returnedResult) in
            switch returnedResult {
            case .success(let record):

                    guard let cep = record["cep"] as? Int else {return}
                    guard let endereco = record["endereco"] as? String else {return}
                    guard let numero = record["numero"] as? Int else {return}
                    guard let preco = record["preco"] as? Double else {return}
                    guard let area_total = record["area_total"] as? Double else {return}
                    guard let num_quartos = record["num_quartos"] as? Int else {return}
                    guard let num_banheiros = record["num_banheiros"] as? Int else {return}
                    guard let num_andares = record["num_andares"] as? Int else {return}
                    guard let possui_garagem = record["possui_garagem"] as? Bool else {return}
                    
                returnedApItems.append(CasaModel(record:record,cep: cep, endereco: endereco, numero: numero, preco: preco, area_total: area_total, num_quartos: num_quartos, num_andares: num_andares, num_banheiros: num_banheiros, possui_garagem: possui_garagem))
        
            case .failure(let error):
                print ("error recordMatchedBlock \(error)")
            }
        }
        
        queryOperation.queryResultBlock = {[weak self] returnedResult in
            print("result queryResultBlock: \(returnedResult)")
            DispatchQueue.main.async {

                self?.casa = returnedApItems
            }
        }
        
        addOperation(operation: queryOperation)
    }
     func updateItem(casa:CasaModel,cep: Int, endereco: String, numero: Int, preco: Double, area_total: Double,num_quartos: Int, num_andares: Int, num_banheiros: Int, possui_garagem: Bool ){
        let record = casa.record
        record["endereco"] = endereco
         record["possui_garagem"] = possui_garagem
         record["cep"] = cep
         record["numero"] = numero
         record["preco"] = preco
         record["num_banheiros"] = num_banheiros
         record["num_quartos"] = num_quartos
         record["area_total"] = area_total
         record["num_andares"] = num_andares
        saveItem(record: record)
    }
    
     func deleteItem(indexSet: IndexSet){
        guard let index = indexSet.first else {return}
        let casa = casa[index]
        let record = casa.record
        
        CKContainer.default().publicCloudDatabase.delete(withRecordID: record.recordID) { [weak self] returnedRecordId, returnedError in
            self?.casa.remove(at:index)
        }
    }
}
