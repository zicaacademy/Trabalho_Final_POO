//
//  HomeView.swift
//  Trabalho_Final_POO
//
//  Created by Luiz Felipe on 29/11/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vmApartamento = ApartamentoCRUD()
    @StateObject var vmCasa = CasaCRUD()
    @StateObject var vmLote = LoteCRUD()
    @State var tipo:Int = 0
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    menuButton
                    Spacer()
                    navigationAddNewButton
                }
                VStack{
                    switch tipo{
                    case 0:
                        listApartamentos
                    case 2:
                        listCasas
                    case 3:
                        listLotes
                    default:
                        Text("erro ao carregar a lista")
                    }
                }
            }.navigationTitle("Imoveis disponiveis")
        }
    }
}

extension HomeView{
    private var menuButton: some View{
        Menu("tipo"){
            Button("apartamentos") {
                tipo = 0
            }
            Button("casas") {
                tipo = 1
            }
            Button("lotes") {
                tipo = 2
            }
        }.buttonStyle(.plain).padding()
    }
    
    private var navigationAddNewButton:some View{
        NavigationLink("add") {
            switch tipo{
            case 0:
                AddApartamentoView()
            case 1:
                AddCasaView()
            case 2:
                AddLoteView()
            default:
                fatalError()
            }
        }.buttonStyle(.plain).padding()
    }
    
    private var listApartamentos:some View{
        List{
            ForEach(vmApartamento.apartamento, id: \.self){ imovel in
                VStack{
                    Text(imovel.endereco)
                    Text(imovel.preco.description)
                }
            }.onDelete(perform: vmApartamento.deleteItem)
        }.listStyle(.sidebar)
    }
    
    private var listCasas: some View{
        List{
            ForEach(vmCasa.casa, id: \.self){ imovel in
                VStack{
                    Text(imovel.endereco)
                    Text(imovel.preco.description)
                }
            }.onDelete(perform: vmCasa.deleteItem)
        }.listStyle(.sidebar)
    }
    
    private var listLotes:some View{
        List{
            ForEach(vmLote.lote, id: \.self){ imovel in
                VStack{
                    Text(imovel.endereco)
                    Text(imovel.preco.description)
                }
            }.onDelete(perform: vmLote.deleteItem)
        }.listStyle(.sidebar)
    }
}

#Preview {
    HomeView()
}
