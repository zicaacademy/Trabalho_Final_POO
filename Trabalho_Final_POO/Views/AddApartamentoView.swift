//
//  AddApartamentoView.swift
//  Trabalho_Final_POO
//
//  Created by Luiz Felipe on 29/11/23.
//

import SwiftUI

struct AddApartamentoView: View {
    @State  var endereco:String = "Endereco"
    @State  var numero:String = "Numero"
    @State  var cep:String = "CEP"
    @State  var preco:String = "Preço"
    @State  var area_total:String = "Area total"
    @State  var num_quartos:String = "Numero de quartos"
    @State  var num_banheiros:String = "Numero de Banheiros"
    @State  var andar:String = "Andar"
    
    @State private var apartamento:Apartamento = Apartamento()
    @StateObject private var vm = ApartamentoCRUD()
    
    let rangeDeNumeros = 1...10
    var body: some View {
        VStack{
            ScrollView{
                VStack(spacing: 10){
                    textFieldModel(text: "CEP:", binding: $cep)
                    enderecoTextField
                    textFieldModel(text: "Numero:", binding: $numero)
                    textFieldModel(text: "Andar:", binding: $andar)
                    textFieldModel(text: "Area total:", binding: $area_total)
                    textFieldModel(text: "Numero de Banheiros:", binding: $num_banheiros)

                    textFieldModel(text: "Numero de quartos:", binding: $num_quartos)

                    textFieldModel(text: "Preço", binding: $preco)
                    Spacer()

                    saveButton
                }.ignoresSafeArea().navigationTitle("adicionar novo apartamento").font(.title).foregroundStyle(Color(.white)).padding()
            }
        }
        
    }
}

extension AddApartamentoView{
    private var enderecoTextField: some View{
        VStack{
            HStack{
                Text("Endereço:").font(.title3)
                Spacer()
            }
            TextField("Endereço:", text: $endereco).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad).foregroundStyle(Color(.gray)).onTapGesture{
                endereco = ""
        }
        }
    }
    private var saveButton:some View{
        Button(action: {
            apartamento.endereco_get_set = endereco
            
            if let numero = Int(numero){
                apartamento.numero_get_set = numero
            }
            if let cep = Int(cep){
                apartamento.cep_get_set = cep
            }
            if let preco = Double(preco){
                apartamento.preco_get_set = preco
            }
            if let area_total = Double(area_total){
                apartamento.area_total_get_set = area_total
            }
            if let num_quartos = Int(num_quartos){
                apartamento.num_quartos_get_set = num_quartos
            }
            if let num_banheiros = Int(num_banheiros){
                apartamento.num_banheiros_get_set = num_banheiros
            }
            if let andar = Int(andar){
                apartamento.andar_get_set = andar
            }
            
            vm.addButtomPressed(cep: apartamento.cep_get_set, endereco: apartamento.endereco_get_set, numero: apartamento.numero_get_set, preco: apartamento.preco_get_set, area_total: apartamento.area_total_get_set, num_quartos: apartamento.num_quartos_get_set, andar: apartamento.andar_get_set, num_banheiros: apartamento.num_banheiros_get_set)
            
        }, label: {
            Text("Adicionar").foregroundStyle(.white).buttonBorderShape(.roundedRectangle).shadow(radius: 10)
        })
    }
}

#Preview {
    AddApartamentoView()
}
