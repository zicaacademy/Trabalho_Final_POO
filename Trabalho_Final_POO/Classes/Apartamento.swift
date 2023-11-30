//
//  Apartamento.swift
//  Trabalho_Final_POO
//
//  Created by Luiz Felipe on 29/11/23.
//

import Foundation

class Apartamento:Imovel{
    private var num_quartos:Int = 0
    private var num_banheiros:Int = 0
    private var andar:Int = 0
    
    var num_quartos_get_set:Int{
        get {
           return num_quartos
        }
        set (novo_num_quartos){
            num_quartos = novo_num_quartos
        }
    }
    
    var num_banheiros_get_set:Int{
        get {
           return num_banheiros
        }
        set (novo_nun_banheiros){
            num_banheiros = novo_nun_banheiros
        }
    }
    
    var andar_get_set:Int{
        get {
           return andar
        }
        set (novo_andar){
            andar = novo_andar
        }
    }
}
