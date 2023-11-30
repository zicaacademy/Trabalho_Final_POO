//
//  ApartamentoCRUD.swift
//  Trabalho_Final_POO
//
//  Created by Luiz Felipe on 30/11/23.
//

import Foundation
import CloudKit


class ApartamentoCRUD:CloudKitCRUD{
    @Published var apartamento: [ApartamentoModel] = []

     func addButtomPressed(cep: Int, endereco: String, numero: Int, preco: Double, area_total: Double,num_quartos: Int, andar: Int, num_banheiros: Int){
        
        addItem(cep: cep, endereco: endereco, numero: numero, preco: preco, area_total: area_total,num_quartos: num_quartos, andar: andar, num_banheiros: num_banheiros)
    }
    
    
     private func addItem(cep: Int, endereco: String, numero: Int, preco: Double, area_total: Double,num_quartos: Int, andar: Int, num_banheiros: Int){
        //tipo do dado adicionado
        let newImovel = CKRecord(recordType: "apartamento")
            newImovel["cep"] = cep
            newImovel["endereco"] = endereco
            newImovel["numero"] = numero
            newImovel["preco"] = preco
            newImovel["area_total"] = area_total
            newImovel["num_quartos"] = num_quartos
            newImovel["num_banheiros"] = num_banheiros
            newImovel["andar"] = andar
    
        saveItem(record: newImovel)
    }
    
    override internal func fetchItems(){
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "apartamento", predicate: predicate)
        
        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true )]
        let queryOperation = CKQueryOperation(query: query )
        
        var returnedApItems:[ApartamentoModel] = []
        
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
                    guard let andar = record["andar"] as? Int else {return}
                    
                returnedApItems.append(ApartamentoModel(record:record,cep: cep, endereco: endereco, numero: numero, preco: preco, area_total: area_total, num_quartos: num_quartos, num_banheiros: num_banheiros, andar: andar))
        
            case .failure(let error):
                print ("error recordMatchedBlock \(error)")
            }
        }
        
        queryOperation.queryResultBlock = {[weak self] returnedResult in
            print("result queryResultBlock: \(returnedResult)")
            DispatchQueue.main.async {

                self?.apartamento = returnedApItems
            }
        }
        
        addOperation(operation: queryOperation)
    }
     func updateItem(apartamento:ApartamentoModel,cep: Int, endereco: String, numero: Int, preco: Double, area_total: Double,num_quartos: Int, andar: Int, num_banheiros: Int){
        let record = apartamento.record
        record["endereco"] = endereco
        record["cep"] = cep
        record["numero"] = numero
        record["preco"] = preco
        record["num_banheiros"] = num_banheiros
        record["num_quartos"] = num_quartos
        record["area_total"] = area_total
        record["andar"] = andar

        saveItem(record: record)
    }
    
     func deleteItem(indexSet: IndexSet){
        guard let index = indexSet.first else {return}
        let apartamento = apartamento[index]
        let record = apartamento.record
        
        CKContainer.default().publicCloudDatabase.delete(withRecordID: record.recordID) { [weak self] returnedRecordId, returnedError in
            self?.apartamento.remove(at:index)
        }
    }
}
