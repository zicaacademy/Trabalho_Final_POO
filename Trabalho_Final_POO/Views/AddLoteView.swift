//
//  AddLoteView.swift
//  Trabalho_Final_POO
//
//  Created by Luiz Felipe on 29/11/23.
//

import SwiftUI

struct AddLoteView: View {
    @State private var endereco:String = ""
    @State private var numero:String = ""
    @State private var cep:String = ""
    @State private var preco:String = ""
    @State private var area_total:String = ""
    @State private var area_construida:String = ""
    @State private var tipo_solo:TipoDeSolo = .arenoso

    
    @State private var lote:Lote = Lote()
    @StateObject private var vm = LoteCRUD()
    var body: some View {
        VStack{
            ScrollView{
                VStack(spacing: 20){
                    textFieldCep
                    textFieldEndereco
                    textFieldNumero
                    textFieldArea_total
                    textFieldArea_construida
                    menuTerreno
                    textFieldPreco
                    
                    saveButton
                }
            }
        }
    }
}
extension AddLoteView{
    private var textFieldEndereco:some View{
        TextField("endereco", text: $endereco).background(Color(.gray).opacity(0.4)).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad)
    }
    private var textFieldNumero:some View{
        TextField("numero", text: $numero).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad)
    }
    private var textFieldCep:some View{
        TextField("cep", text: $cep).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad)
    }
    private var textFieldPreco:some View{
        TextField("preco", text: $preco).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad)
    }
    private var textFieldArea_total:some View{
        TextField("area_total", text: $area_total).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad)
    }
    private var textFieldArea_construida:some View{
        TextField("area_construida", text: $area_construida).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad)
    }
    private var menuTerreno:some View{
        HStack{
            Text("tipo de terreno:")
            Menu(tipo_solo.rawValue){
                Button("arenoso") {
                    tipo_solo = .arenoso
                }
                Button("argiloso") {
                    tipo_solo = .argiloso
                }
                Button("misto") {
                    tipo_solo = .misto
                }
                Button("pedregoso") {
                    tipo_solo = .pedregoso
                }
            }.menuStyle(.borderlessButton)
        }
    }
    private var saveButton:some View{
        Button(action: {
            lote.endereco_get_set = endereco
            
            if let numero = Int(numero){
                lote.numero_get_set = numero
            }
            if let cep = Int(cep){
                lote.cep_get_set = cep
            }
            if let preco = Double(preco){
                lote.preco_get_set = preco
            }
            if let area_total = Double(area_total){
                lote.area_total_get_set = area_total
            }
            if let area_contruida = Double(area_construida){
                lote.area_construida_get_set = area_contruida
            }
            lote.tipo_solo_get_set = tipo_solo
            
            
            
            vm.addButtomPressed(cep: lote.cep_get_set, endereco: lote.endereco_get_set, numero: lote.numero_get_set, preco: lote.preco_get_set, area_total: lote.area_total_get_set,tipo_solo: lote.tipo_solo_get_set, area_construida: lote.area_construida_get_set)
        }, label: {
            Text("Button")
        })
    }
}
#Preview {
    AddLoteView()
}
