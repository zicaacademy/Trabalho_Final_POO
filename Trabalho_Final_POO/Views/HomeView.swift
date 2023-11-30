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
        NavigationStack{
            
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
                    case 1:
                        listCasas
                    case 2:
                        listLotes
                    default:
                        Text("erro ao carregar a lista")
                    }
                }
            }.navigationTitle("Imoveis disponiveis").onAppear(perform: vmApartamento.fetchItems)
        }
    }
}

extension HomeView{
    private var menuButton: some View{
        Menu("tipo"){
            Button("apartamentos") {
                tipo = 0
                vmApartamento.fetchItems()
                print(tipo)

            }
            Button("casas") {
                tipo = 1
                vmCasa.fetchItems()
                print(tipo)
            }
            Button("lotes") {
                tipo = 2
                vmLote.fetchItems()
                print(tipo)

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
        NavigationStack{
            Section(header: Text("Apartamentos")) {
                List{
                    ForEach(vmApartamento.apartamento, id: \.self){ imovel in
                        VStack{
                            NavigationLink {
                                EditApartamentoView(imovel: imovel)
                            } label: {
                                ApartamentoView(apartamento: imovel)
                            }
                        }
                    }.onDelete(perform: vmApartamento.deleteItem)
                }.listStyle(.sidebar)
            }
        }.navigationViewStyle(DefaultNavigationViewStyle())
    }
    
    private var listCasas: some View{
        NavigationStack{
            Section(header: Text("Casas:")) {
                List{
                    ForEach(vmCasa.casa, id: \.self){ imovel in
                        VStack{
                            NavigationLink {
                                EditCasaView(imovel: imovel)
                            } label: {
                                CasaView(casa: imovel)
                            }
                        }
                    }.onDelete(perform: vmCasa.deleteItem)
                }.listStyle(.sidebar)
            }
        }.navigationViewStyle(DefaultNavigationViewStyle())
    }
    
    private var listLotes:some View{
        NavigationStack{
            Section(header: Text("Lotes:")) {
                List{
                    ForEach(vmLote.lote, id: \.self){ imovel in
                        VStack{
                            NavigationLink {
                                EditLoteView(imovel: imovel)
                            } label: {
                                LoteView(lote: imovel)
                            }
                        }
                    }.onDelete(perform: vmCasa.deleteItem)
                }.listStyle(.sidebar)
            }
        }.navigationViewStyle(DefaultNavigationViewStyle())
    }
}

#Preview {
    HomeView()
}
