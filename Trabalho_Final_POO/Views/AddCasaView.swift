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
                VStack(spacing: 20){
                    textFieldCep
                    textFieldEndereco
                    textFieldNumero
                    textFieldAndar
                    textFieldArea_total
                    textFieldNum_quartos
                    textFieldNum_banheiros
                    toggleGaragem
                    textFieldPreco
                    
                    saveButton
                }.navigationTitle("Add nova casa")
            }
        }
    }
}

extension AddCasaView{
    private var textFieldEndereco: some View{
        TextField("endereco", text: $endereco).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle())
    }
    private var textFieldNumero: some View{
        TextField("numero", text: $numero).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad)
    }
    private var textFieldCep: some View{
        TextField("cep", text: $cep).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad)
    }
    private var textFieldPreco: some View{
        TextField("preco", text: $preco).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.decimalPad)
    }
    private var textFieldArea_total: some View{
        TextField("area_total", text: $area_total).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.decimalPad)
    }
    private var textFieldNum_quartos: some View{
        TextField("num_quartos", text: $num_quartos).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad)
    }
    private var textFieldNum_banheiros: some View{
        TextField("num_banheiros", text: $num_banheiros).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad)
    }
    private var textFieldAndar: some View{
        TextField("num_andares", text: $num_andares).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad)
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
