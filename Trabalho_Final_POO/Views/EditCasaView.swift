//
//  EditCasaView.swift
//  Trabalho_Final_POO
//
//  Created by Luiz Felipe on 30/11/23.
//

import SwiftUI

struct EditCasaView: View {
    @State private var novoEndereco:String 
    @State private var novoNumero:String
    @State private var novoCep:String
    @State private var novoPreco:String
    @State private var novoArea_total:String
    @State private var novoNum_quartos:String
    @State private var novoNum_banheiros:String
    @State private var novoNum_andares:String
    @State private var novoPossui_garagem:Bool
    
    var edit:CasaModel
    @State var casa:Casa = Casa()
    @StateObject private var vm = CasaCRUD()
    
    init(imovel:CasaModel){
        _novoEndereco = State(initialValue: imovel.endereco)
        _novoCep = State(initialValue: String(imovel.cep))
        _novoNumero = State(initialValue: String(imovel.numero))
        _novoPreco = State(initialValue: String(imovel.preco))
        _novoNum_quartos = State(initialValue: String(imovel.num_quartos))
        _novoNum_banheiros = State(initialValue: String(imovel.num_banheiros))
        _novoArea_total = State(initialValue: String(imovel.area_total))
        _novoNum_andares = State(initialValue: String(imovel.num_andares))
        _novoPossui_garagem = State(initialValue: Bool(imovel.possui_garagem))
        self.edit = imovel
    }
    var body: some View {
        VStack{
            ScrollView{
                VStack(spacing: 10){
                    textFieldModel(text: "CEP:", binding: $novoCep)
                    enderecoTextField
                    textFieldModel(text: "Numero:", binding: $novoNumero)
                    textFieldModel(text: "Numero de andar:", binding: $novoNum_andares)
                    textFieldModel(text: "Area total:", binding: $novoArea_total)
                    textFieldModel(text: "Numero de Banheiros:", binding: $novoNum_banheiros)

                    textFieldModel(text: "Numero de quartos:", binding: $novoNum_quartos)

                    textFieldModel(text: "Preço", binding: $novoPreco)
                    toggleGaragem
                    Spacer()

                    saveButton
                }.navigationTitle("Add nova casa").padding()
            }
        }
    }
}

extension EditCasaView{
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
    private var toggleGaragem: some View{
        Toggle("garagem", isOn: $novoPossui_garagem).toggleStyle(.automatic)
    }
    private var saveButton:some View{
        
        Button(action: {
            casa.endereco_get_set = novoEndereco
            
            if let numero = Int(novoNumero){
                casa.numero_get_set = numero
            }
            if let cep = Int(novoCep){
                casa.cep_get_set = cep
            }
            if let preco = Double(novoPreco){
                casa.preco_get_set = preco
            }
            if let area_total = Double(novoArea_total){
                casa.area_total_get_set = area_total
            }
            if let num_quartos = Int(novoNum_quartos){
                casa.num_quartos_get_set = num_quartos
            }
            if let num_banheiros = Int(novoNum_banheiros){
                casa.num_banheiros_get_set = num_banheiros
            }
            if let num_andar = Int(novoNum_andares){
                casa.num_andares_get_set = num_andar
            }
            casa.possui_garagem_get_set = novoPossui_garagem
            
            vm.updateItem(casa: edit, cep: casa.cep_get_set, endereco: casa.endereco_get_set, numero: casa.numero_get_set, preco: casa.preco_get_set, area_total: casa.area_total_get_set, num_quartos: casa.num_quartos_get_set, num_andares: casa.num_andares_get_set, num_banheiros: casa.num_andares_get_set, possui_garagem: casa.possui_garagem_get_set)
            
        }, label: {
            Text("Salvar Alterações").foregroundStyle(.white).buttonBorderShape(.roundedRectangle).shadow(radius: 10)
        })
    }
}
