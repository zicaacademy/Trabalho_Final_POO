//
//  Casa.swift
//  Trabalho_Final_POO
//
//  Created by Luiz Felipe on 29/11/23.
//

import Foundation

class Casa:Imovel{
    
    private var num_quartos:Int = 0
    private var num_andares:Int = 0
    private var num_banheiros:Int = 0
    private var possui_garagem:Bool = false
 
    
    var num_quartos_get_set:Int{
        get {
           return num_quartos
        }
        set (novo_num_quartos){
            num_quartos = novo_num_quartos
        }
    }
    
    var num_andares_get_set:Int{
        get {
           return num_andares
        }
        set (novo_num_andares){
            num_andares = novo_num_andares
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
    
    var possui_garagem_get_set:Bool{
        get {
           return possui_garagem
        }
        set (novo_possui_garagem){
            possui_garagem = novo_possui_garagem
        }
    }
    
    
    
}
