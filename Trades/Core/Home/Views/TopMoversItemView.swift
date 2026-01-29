//
//  TopMoversItemView.swift
//  Trades
//
//  Created by Mustafa Emir Ata on 29.01.2026.
//

import SwiftUI

struct TopMoversItemView: View {
    @StateObject var viewModel:HomeViewModel
    let coin:Coin
    var body: some View {
        VStack(alignment: .leading) {
            // resim
            AsyncImage(url: URL(string: coin.image)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure(_):
                    Image(systemName: "bitcoinsign.circle.fill")
                        .resizable()
                        .foregroundColor(.orange)
                case .empty:
                    ProgressView()
                @unknown default:
                    Image(systemName: "bitcoinsign.circle.fill")
                        .resizable()
                        .foregroundColor(.orange)
                }
            }
            .frame(width: 30, height: 30)
            .padding(.bottom, 8)
            
    
            //bilgi
            HStack(spacing: 2){
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                Text("$\(String(format: "%.2f", coin.currentPrice ?? 0))")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
            
            
            //değişim
            Text("\(String(format: "%.2f", coin.priceChangePercentage24H ?? 0))%")
                .font(.title2)
                .foregroundColor((coin.priceChangePercentage24H ?? 0) >= 0 ? .green : .red)
        }
        .frame(width: 130,height: 130)
        .background(Color("ItemBackgroundColor"))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4),lineWidth: 2)
        )
    }
}
/*
#Preview {
    TopMoversItemView()
}
*/
