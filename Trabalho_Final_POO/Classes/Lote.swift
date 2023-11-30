//
//  Lote.swift
//  Trabalho_Final_POO
//
//  Created by Luiz Felipe on 29/11/23.
//

import Foundation

enum TipoDeSolo:String{
    case arenoso
    case argiloso
    case pedregoso
    case misto
}

class Lote:Imovel{
    private var tipo_solo:TipoDeSolo = .misto
    private var area_construida:Double = 0

    
    var tipo_solo_get_set:TipoDeSolo{
        get {
           return tipo_solo
        }
        set (novo_tipo_solo){
            tipo_solo = novo_tipo_solo
        }
    }
    
    var area_construida_get_set:Double{
        get {
           return area_construida
        }
        set (novo_area_construida){
            area_construida = novo_area_construida
        }
    }
}
