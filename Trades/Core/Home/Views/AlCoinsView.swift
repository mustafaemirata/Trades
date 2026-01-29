//
//  AlCoinsView.swift
//  Trades
//
//  Created by Mustafa Emir Ata on 29.01.2026.
//

import SwiftUI

struct AlCoinsView: View {
    @StateObject var viewModel:HomeViewModel
    var body: some View {
        VStack{
            Text("Tüm Coinler")
                .font(.headline)
                .padding()
            
            HStack{
                Text("Coin")
                    .font(.caption)
                Spacer()
                Text("Fiyat")
            }
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.horizontal)
            
            ScrollView{
                VStack{
                    ForEach(viewModel.coins){ coin in
                            CoinRowView(coin: coin)
                        
                    }
                }
            }
            
        }
        
    }
}
/*
#Preview {
    AlCoinsView()
}
*/
