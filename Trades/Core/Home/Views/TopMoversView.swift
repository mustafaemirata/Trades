//
//  TopMovers.swift
//  Trades
//
//  Created by Mustafa Emir Ata on 29.01.2026.
//

import SwiftUI

struct TopMovers: View {
    @StateObject var viewModel:HomeViewModel
    var body: some View {
        VStack(alignment:.leading){
            Text("Popüler Coinler")
                .font(.headline)
                .fontWeight(.bold)
            ScrollView(.horizontal){
                HStack(spacing:16){
                    ForEach(viewModel.topMovingCoins){ coin in
                        TopMoversItemView(viewModel: viewModel, coin: coin)
                    }
                }
            }
        }
        .padding()

    }
}

#Preview {
    TopMovers(viewModel: HomeViewModel())
}
