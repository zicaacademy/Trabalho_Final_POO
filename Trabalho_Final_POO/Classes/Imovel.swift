//
//  Imovel.swift
//  Trabalho_Final_POO
//
//  Created by Luiz Felipe on 29/11/23.
//

import Foundation


class Imovel{
    var id = UUID()
    private var cep:Int = 0
    private var endereco:String = ""
    private var numero:Int = 0
    private var preco: Double = 0
    private var area_total:Double = 0
    
    var cep_get_set:Int{
        get {
           return cep
        }
        set (novo_cep){
            cep = novo_cep
        }
    }
    
    var endereco_get_set:String{
        get {
           return endereco
        }
        set (novo_endereco){
            endereco = novo_endereco
        }
    }
    
    var numero_get_set:Int{
        get {
           return numero
        }
        set (novo_numero){
            numero = novo_numero
        }
    }
    
    var preco_get_set:Double{
        get {
           return preco
        }
        set (novo_preco){
            preco = novo_preco
        }
    }
    
    var area_total_get_set:Double{
        get {
           return area_total
        }
        set (novo_area_total){
            area_total = novo_area_total
        }
    }
    
}
