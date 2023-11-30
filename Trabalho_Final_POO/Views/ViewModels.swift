//
//  ViewModels.swift
//  Trabalho_Final_POO
//
//  Created by Luiz Felipe on 30/11/23.
//

import Foundation
import SwiftUI

struct textFieldModel: View{
    @State var text:String
    @Binding var binding:String
    var body: some View {
        VStack{
            HStack{
                Text(text).font(.title3)
                Spacer()
            }
            TextField(binding, text: $binding).frame(height: 40).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad).foregroundStyle(Color(.gray)).onTapGesture{
                    binding = ""
            }
        }
    }
}

struct ApartamentoView: View {
    let apartamento: ApartamentoModel

    var body: some View {
        HStack{
            VStack {
                Text("Apartamento:")
                    .font(.headline)
                Text("CEP: \(apartamento.cep)")
                Text("Endereço: \(apartamento.endereco)")
                Text("Número: \(apartamento.numero)")
                Text("Preço: \(apartamento.preco)")
                Text("Área Total: \(apartamento.area_total)")
                Text("Número de Quartos: \(apartamento.num_quartos)")
                Text("Número de Banheiros: \(apartamento.num_banheiros)")
                Text("Andar: \(apartamento.andar)")
            }
            .padding()
            Spacer()
        }
    }
}

struct CasaView: View {
    let casa: CasaModel

    var body: some View {
        HStack{
            VStack {
                Text("Casa:")
                    .font(.headline)
                Text("CEP: \(casa.cep)")
                Text("Endereço: \(casa.endereco)")
                Text("Número: \(casa.numero)")
                Text("Preço: \(casa.preco)")
                Text("Área Total: \(casa.area_total)")
                Text("Número de Quartos: \(casa.num_quartos)")
                Text("Número de Andares: \(casa.num_andares)")
                Text("Número de Banheiros: \(casa.num_banheiros)")
                Text("Possui Garagem: \(casa.possui_garagem ? "Sim" : "Não")")
            }
            .padding()
            Spacer()
        }
    }
}

struct LoteView: View {
    let lote: LoteModel

    var body: some View {
        HStack{
            VStack {
                Text("Lote:")
                    .font(.headline)
                Text("CEP: \(lote.cep)")
                Text("Endereço: \(lote.endereco)")
                Text("Número: \(lote.numero)")
                Text("Preço: \(lote.preco)")
                Text("Área Total: \(lote.area_total)")
                Text("Tipo de Solo: \(lote.tipo_solo)")
                Text("Área Construída: \(lote.area_construida)")
            }
            .padding()
            Spacer()
        }
    }
}
