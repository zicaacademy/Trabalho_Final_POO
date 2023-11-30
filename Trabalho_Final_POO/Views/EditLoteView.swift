//
//  EditLoteView.swift
//  Trabalho_Final_POO
//
//  Created by Luiz Felipe on 30/11/23.
//

import SwiftUI

struct EditLoteView: View {
    @State private var novoEndereco:String 
    @State private var novoNumero:String
    @State private var novoCep:String
    @State private var novoPreco:String
    @State private var novoArea_total:String
    @State private var novoArea_construida:String
    @State private var novoTipo_solo:TipoDeSolo
    
    var edit:LoteModel
    @State var lote:Lote = Lote()
    @StateObject private var vm = LoteCRUD()
    
    init(imovel:LoteModel){
        _novoEndereco = State(initialValue: imovel.endereco)
        _novoCep = State(initialValue: String(imovel.cep))
        _novoNumero = State(initialValue: String(imovel.numero))
        _novoPreco = State(initialValue: String(imovel.preco))
        _novoArea_construida = State(initialValue: String(imovel.area_construida))
        _novoTipo_solo = State(initialValue: TipoDeSolo(rawValue: imovel.tipo_solo) ?? .misto)
        _novoArea_total = State(initialValue: String(imovel.area_total))

        self.edit = imovel
    }
    var body: some View {
        VStack{
            ScrollView{
                VStack(spacing: 10){
                    textFieldModel(text: "CEP:", binding: $novoCep)
                    enderecoTextField
                    textFieldModel(text: "Numero:", binding: $novoNumero)
                    textFieldModel(text: "Area construida:", binding: $novoArea_construida)
                    textFieldModel(text: "Area total:", binding: $novoArea_total)
                    menuTerreno
                    textFieldModel(text: "Preço", binding: $novoPreco)
                    
                    
                    Spacer()
                    saveButton
                }.navigationTitle("Editar Lote").padding()
            }
        }
    }
}
extension EditLoteView{
    private var enderecoTextField: some View{
        VStack{
            HStack{
                Text("Endereço:").font(.title3)
                Spacer()
            }
            TextField(novoEndereco, text: $novoEndereco).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad).foregroundStyle(Color(.gray)).onTapGesture{
                novoEndereco = ""
        }
        }
    }
    
    private var menuTerreno:some View{
        HStack{
            Text("Tipo de terreno:")
            Menu(novoTipo_solo.rawValue){
                Button("arenoso") {
                    novoTipo_solo = .arenoso
                }
                Button("argiloso") {
                    novoTipo_solo = .argiloso
                }
                Button("misto") {
                    novoTipo_solo = .misto
                }
                Button("pedregoso") {
                    novoTipo_solo = .pedregoso
                }
            }.menuStyle(.borderlessButton)
        }
    }
    
    private var saveButton:some View{
        Button(action: {
            lote.endereco_get_set = novoEndereco
            
            if let numero = Int(novoNumero){
                lote.numero_get_set = numero
            }
            if let cep = Int(novoCep){
                lote.cep_get_set = cep
            }
            if let preco = Double(novoPreco){
                lote.preco_get_set = preco
            }
            if let area_total = Double(novoArea_total){
                lote.area_total_get_set = area_total
            }
            if let area_construida = Double(novoArea_construida){
                lote.area_construida_get_set = area_construida
            }
            if let tipo_solo = TipoDeSolo(rawValue: novoTipo_solo.rawValue){
                lote.tipo_solo_get_set = novoTipo_solo
            }

            
            vm.updateItem(lote: edit, cep: lote.cep_get_set, endereco: lote.endereco_get_set, numero: lote.numero_get_set, preco: lote.preco_get_set, area_total: lote.area_total_get_set, tipo_solo: lote.tipo_solo_get_set, area_construida: lote.area_construida_get_set)
            
        }, label: {
            Text("Salvar Alterações").foregroundStyle(.white).buttonBorderShape(.roundedRectangle).shadow(radius: 10)
        })
    }
}

