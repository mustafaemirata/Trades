//
//  HomeViewModel.swift
//  Trades
//
//  Created by Mustafa Emir Ata on 29.01.2026.
//

import SwiftUI
internal import Combine
class HomeViewModel:ObservableObject{
    @Published var coins = [Coin]()
    @Published var isLoading=false
    @Published var topMovingCoins=[Coin]()
    
    init(){
        fetchCoinData()
    }
    func fetchCoinData(){
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"
        guard let url=URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) {data, response, error in
            
            if let error=error{
                print("ERROR! \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse{
                print("RESPONSE CODE: \(response.statusCode)")
            }
            
            
            guard let data = data else{return}
            do{
                let coins=try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.coins=coins
                    self.confTopMovingCoins()
                }
            }catch let error{
                print("DECODE ERROR! \(error)")
            }
        }
        .resume()
    }
    func confTopMovingCoins(){
        let topMovers = coins.sorted(by: { ($0.priceChangePercentage24H ?? 0) > ($1.priceChangePercentage24H ?? 0) })
        self.topMovingCoins=Array(topMovers.prefix(5))
    }
}
