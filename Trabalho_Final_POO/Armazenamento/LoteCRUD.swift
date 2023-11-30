//
//  LoteCRUD.swift
//  Trabalho_Final_POO
//
//  Created by Luiz Felipe on 30/11/23.
//

import Foundation
import CloudKit

class LoteCRUD:CloudKitCRUD{
    @Published var lote: [LoteModel] = []
    
    func addButtomPressed(cep: Int, endereco: String, numero: Int, preco: Double, area_total: Double,tipo_solo:TipoDeSolo, area_construida:Double){
        
        addItem(cep: cep, endereco: endereco, numero: numero, preco: preco, area_total: area_total, tipo_solo:tipo_solo, area_construida:area_construida)
    }
    
    
    private func addItem(cep: Int, endereco: String, numero: Int, preco: Double, area_total: Double,tipo_solo:TipoDeSolo, area_construida:Double){
        //tipo do dado adicionado
        let newImovel = CKRecord(recordType: "lote")
        newImovel["cep"] = cep
        newImovel["endereco"] = endereco
        newImovel["numero"] = numero
        newImovel["preco"] = preco
        newImovel["area_total"] = area_total
        newImovel["tipo_solo"] = tipo_solo.rawValue
        newImovel["area_construida"] = area_construida
        
        
        saveItem(record: newImovel)
    }
    
    override internal func fetchItems(){
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "lote", predicate: predicate)
        
        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true )]
        let queryOperation = CKQueryOperation(query: query )
        
        var returnedApItems:[LoteModel] = []
        
        queryOperation.recordMatchedBlock = {(returnedRecordId, returnedResult) in
            switch returnedResult {
            case .success(let record):
                
                guard let cep = record["cep"] as? Int else {return}
                guard let endereco = record["endereco"] as? String else {return}
                guard let numero = record["numero"] as? Int else {return}
                guard let preco = record["preco"] as? Double else {return}
                guard let area_total = record["area_total"] as? Double else {return}
                guard let tipo_solo = record["tipo_solo"] as? String else {return}
                guard let area_construida = record["area_construida"] as? Double else {return}
                
                
                returnedApItems.append(LoteModel(record:record,cep: cep, endereco: endereco, numero: numero, preco: preco, area_total: area_total, tipo_solo:tipo_solo, area_construida:area_construida))
                
            case .failure(let error):
                print ("error recordMatchedBlock \(error)")
            }
        }
        
        queryOperation.queryResultBlock = {[weak self] returnedResult in
            print("result queryResultBlock: \(returnedResult)")
            DispatchQueue.main.async {
                
                self?.lote = returnedApItems
            }
        }
        
        addOperation(operation: queryOperation)
    }
    
    func updateItem(lote:LoteModel,cep: Int, endereco: String, numero: Int, preco: Double, area_total: Double,tipo_solo:TipoDeSolo, area_construida:Double ){
        let record = lote.record
        record["endereco"] = endereco
        record["cep"] = cep
        record["numero"] = numero
        record["preco"] = preco
        record["area_construida"] = area_construida
        record["tipo_solo"] = tipo_solo.rawValue
        record["area_total"] = area_total
        
        
        saveItem(record: record)
    }
    
    func deleteItem(indexSet: IndexSet){
        guard let index = indexSet.first else {return}
        let lote = lote[index]
        let record = lote.record
        
        CKContainer.default().publicCloudDatabase.delete(withRecordID: record.recordID) { [weak self] returnedRecordId, returnedError in
            self?.lote.remove(at:index)
        }
    }
}
