//
//  AddApartamentoView.swift
//  Trabalho_Final_POO
//
//  Created by Luiz Felipe on 29/11/23.
//

import SwiftUI

struct AddApartamentoView: View {
    @State  var endereco:String = ""
    @State  var numero:String = ""
    @State  var cep:String = ""
    @State  var preco:String = ""
    @State  var area_total:String = ""
    @State  var num_quartos:String = ""
    @State  var num_banheiros:String = ""
    @State  var andar:String = ""
    
    @State private var apartamento:Apartamento = Apartamento()
    @StateObject private var vm = ApartamentoCRUD()
    
    let rangeDeNumeros = 1...10
    var body: some View {
        VStack{
            ScrollView{
                VStack(spacing: 20){
                    textFieldCep
                    textFieldEndereco
                    textFieldNumero
                    textFieldAndar
                    textFieldArea_total
                    textFieldNum_banheiros
                    textFieldNum_quartos
                    textFieldPreco
                    saveButton
                }.ignoresSafeArea().navigationTitle("adicionar novo apartamento").font(.title).foregroundStyle(Color(.white)).padding()
            }
        }
        
    }
}

extension AddApartamentoView{
    
    private var textFieldEndereco:some View{
        TextField("endereco", text: $endereco).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle())
    }
    private var textFieldNumero:some View{
        TextField("numero", text: $numero).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad)
    }
    private var textFieldCep:some View{
        TextField("cep", text: $cep).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad)
    }
    private var textFieldPreco:some View{
        TextField("preco", text: $preco).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.decimalPad)
    }
    private var textFieldArea_total:some View{
        TextField("area_total", text: $area_total).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.decimalPad)
    }
    private var textFieldNum_quartos:some View{
        TextField("num_quartos", text: $num_quartos).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad)
    }
    private var textFieldNum_banheiros:some View{
        TextField("num_banheiros", text: $num_banheiros).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad)
    }
    private var textFieldAndar:some View{
        TextField("andar", text: $andar).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad)
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
            Text("Button").foregroundStyle(.white).buttonBorderShape(.roundedRectangle).shadow(radius: 10)
        })
    }
}

#Preview {
    AddApartamentoView()
}
