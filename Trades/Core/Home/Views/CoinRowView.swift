//
//  CoinRowView.swift
//  Trades
//
//  Created by Mustafa Emir Ata on 29.01.2026.
//

import SwiftUI

struct CoinRowView: View {
    @StateObject var viewmodel=HomeViewModel()
    let coin:Coin
    var body: some View {
        HStack{
            //sıra
            Text("\(coin.marketCapRank ?? 1)")
                .font(.caption)
                .foregroundColor(.gray)
            
            //resim
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
            .frame(width: 32, height: 32)
            
            //isim
            VStack(alignment: .leading, spacing: 4){
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading,4)
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading,4)
            }
            .padding(.leading,3)
            Spacer()
            
            //fiyat
            
            VStack(alignment: .trailing, spacing: 4){
                Text("$\(String(format: "%.2f", coin.currentPrice ?? 0))")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading,4)
                Text("\(String(format: "%.2f", coin.priceChangePercentage24H ?? 0))%")
                    .font(.caption)
                    .padding(.leading,4)
                    .foregroundColor((coin.priceChangePercentage24H ?? 0) >= 0 ? .green : .red)
            }
            .padding(.trailing)

        }
        .padding(.horizontal)
        .padding(.vertical,5)
        
        

    }
}
/*
#Preview {
    CoinRowView()
}
*/
