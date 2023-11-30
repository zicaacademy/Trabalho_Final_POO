//
//  AddCasaView.swift
//  Trabalho_Final_POO
//
//  Created by Luiz Felipe on 29/11/23.
//

import SwiftUI

struct AddCasaView: View {
    @State private var endereco:String = ""
    @State private var numero:String = ""
    @State private var cep:String = ""
    @State private var preco:String = ""
    @State private var area_total:String = ""
    @State private var num_quartos:String = ""
    @State private var num_banheiros:String = ""
    @State private var num_andares:String = ""
    @State private var possui_garagem:Bool = false
    
    @State private var casa:Casa = Casa()
    @StateObject private var vm = CasaCRUD()
    
    var body: some View {
        VStack{
            ScrollView{
                VStack(spacing: 10){
                    textFieldModel(text: "CEP:", binding: $cep)
                    enderecoTextField
                    textFieldModel(text: "Numero:", binding: $numero)
                    textFieldModel(text: "Numero de andar:", binding: $num_andares)
                    textFieldModel(text: "Area total:", binding: $area_total)
                    textFieldModel(text: "Numero de Banheiros:", binding: $num_banheiros)

                    textFieldModel(text: "Numero de quartos:", binding: $num_quartos)

                    textFieldModel(text: "Preço", binding: $preco)
                    toggleGaragem
                    Spacer()

                    saveButton
                }.navigationTitle("Add nova casa").padding()
            }
        }
    }
}

extension AddCasaView{
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
    private var toggleGaragem: some View{
        Toggle("garagem", isOn: $possui_garagem).toggleStyle(.automatic)
    }
    private var saveButton:some View{
        Button(action: {
            casa.endereco_get_set = endereco
            
            if let numero = Int(numero){
                casa.numero_get_set = numero
            }
            if let cep = Int(cep){
                casa.cep_get_set = cep
            }
            if let preco = Double(preco){
                casa.preco_get_set = preco
            }
            if let area_total = Double(area_total){
                casa.area_total_get_set = area_total
            }
            if let num_quartos = Int(num_quartos){
                casa.num_quartos_get_set = num_quartos
            }
            if let num_banheiros = Int(num_banheiros){
                casa.num_banheiros_get_set = num_banheiros
            }
            if let num_andar = Int(num_andares){
                casa.num_andares_get_set = num_andar
            }
            casa.possui_garagem_get_set = possui_garagem
            
            
            vm.addButtomPressed(cep: casa.cep_get_set, endereco: casa.endereco_get_set, numero: casa.numero_get_set, preco: casa.preco_get_set, area_total: casa.area_total_get_set, num_quartos: casa.num_quartos_get_set, num_andares: casa.num_andares_get_set,num_banheiros: casa.num_banheiros_get_set, possui_garagem: casa.possui_garagem_get_set)
        }, label: {
            Text("Button").foregroundStyle(.white).buttonBorderShape(.roundedRectangle).shadow(radius: 10)
        })
    }
    
}

#Preview {
    AddCasaView()
}
