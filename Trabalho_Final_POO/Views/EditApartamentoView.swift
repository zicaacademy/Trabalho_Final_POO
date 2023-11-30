//
//  EditApartamentoView.swift
//  Trabalho_Final_POO
//
//  Created by Luiz Felipe on 30/11/23.
//

import SwiftUI

struct EditApartamentoView: View {
    @State  var novoEndereco:String
    @State  var novoNumero:String
    @State  var novoCep:String
    @State  var novoPreco:String
    @State  var novoArea_total:String
    @State  var novoNum_quartos:String
    @State  var novoNum_banheiros:String
    @State  var novoAndar:String
    
    var edit:ApartamentoModel
    @State var apartamento:Apartamento = Apartamento()
    @StateObject private var vm = ApartamentoCRUD()
    
    init(imovel:ApartamentoModel){
        _novoEndereco = State(initialValue: imovel.endereco)
        _novoCep = State(initialValue: String(imovel.cep))
        _novoNumero = State(initialValue: String(imovel.numero))
        _novoPreco = State(initialValue: String(imovel.preco))
        _novoNum_quartos = State(initialValue: String(imovel.num_quartos))
        _novoNum_banheiros = State(initialValue: String(imovel.num_banheiros))
        _novoArea_total = State(initialValue: String(imovel.area_total))
        _novoAndar = State(initialValue: String(imovel.andar))
        self.edit = imovel
    }
    
    var body: some View {
        VStack{
            ScrollView{
                VStack(spacing: 20){
                    textFieldModel(text: "CEP:", binding: $novoCep)
                    enderecoTextField
                    textFieldModel(text: "Numero:", binding: $novoNumero)
                    textFieldModel(text: "Andar:", binding: $novoAndar)
                    textFieldModel(text: "Area total:", binding: $novoArea_total)
                    textFieldModel(text: "Numero de Banheiros:", binding: $novoNum_banheiros)

                    textFieldModel(text: "Numero de quartos:", binding: $novoNum_quartos)

                    textFieldModel(text: "Preço", binding: $novoPreco)
                    Spacer()

                    saveButton
                }.ignoresSafeArea().navigationTitle("Editar apartamento").font(.title).foregroundStyle(Color(.white)).padding()
            }
        }
    }
}
extension EditApartamentoView{
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
    private var saveButton:some View{
        Button(action: {
            apartamento.endereco_get_set = novoEndereco
            
            if let numero = Int(novoNumero){
                apartamento.numero_get_set = numero
            }
            if let cep = Int(novoCep){
                apartamento.cep_get_set = cep
            }
            if let preco = Double(novoPreco){
                apartamento.preco_get_set = preco
            }
            if let area_total = Double(novoArea_total){
                apartamento.area_total_get_set = area_total
            }
            if let num_quartos = Int(novoNum_quartos){
                apartamento.num_quartos_get_set = num_quartos
            }
            if let num_banheiros = Int(novoNum_banheiros){
                apartamento.num_banheiros_get_set = num_banheiros
            }
            if let andar = Int(novoAndar){
                apartamento.andar_get_set = andar
            }
            
            vm.updateItem(apartamento: edit, cep: apartamento.cep_get_set, endereco: apartamento.endereco_get_set, numero: apartamento.numero_get_set, preco: apartamento.preco_get_set, area_total: apartamento.area_total_get_set, num_quartos: apartamento.num_quartos_get_set, andar: apartamento.andar_get_set, num_banheiros: apartamento.num_banheiros_get_set)
            
        }, label: {
            Text("Salvar Alterações").foregroundStyle(.white).buttonBorderShape(.roundedRectangle).shadow(radius: 10)
        })
    }
}
//#Preview {
//   // EditApartamentoView()
//}
