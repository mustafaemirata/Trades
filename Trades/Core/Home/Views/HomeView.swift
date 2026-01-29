//
//  HomeView.swift
//  Trades
//
//  Created by Mustafa Emir Ata on 29.01.2026.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel=HomeViewModel()
    var body: some View {
        NavigationView{
            ScrollView(.vertical,showsIndicators: false){
                TopMovers(viewModel: viewModel)
                Divider()
                AlCoinsView(viewModel: viewModel)
            }
            .navigationTitle("Canlı Veriler")
        }
    }
}

#Preview {
    HomeView()
}
