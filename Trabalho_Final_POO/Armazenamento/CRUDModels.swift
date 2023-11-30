//
//  CRUDModels.swift
//  Trabalho_Final_POO
//
//  Created by Luiz Felipe on 29/11/23.
//

import Foundation
import CloudKit

struct ApartamentoModel: Hashable{
    let record:CKRecord
    let id = UUID()
    let cep:Int
    let endereco:String
    let numero:Int
    let preco: Double
    let area_total:Double
    let num_quartos:Int
    let num_banheiros:Int
    let andar:Int
}

struct CasaModel: Hashable{
    let record:CKRecord
    let id = UUID()
    let cep:Int
    let endereco:String
    let numero:Int
    let preco: Double
    let area_total:Double
    let num_quartos:Int
    let num_andares:Int
    let num_banheiros:Int
    let possui_garagem:Bool
    
}

struct LoteModel: Hashable{
    let record:CKRecord
    let id = UUID()
    let cep:Int
    let endereco:String
    let numero:Int
    let preco: Double
    let area_total:Double
    let tipo_solo:String
    let area_construida:Double
}
